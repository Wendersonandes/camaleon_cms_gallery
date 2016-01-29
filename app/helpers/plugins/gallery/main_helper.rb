module Plugins::Gallery::MainHelper
  def self.included(klass)
    # klass.helper_method [:my_helper_method] rescue "" # here your methods accessible from views
  end

  # here all actions on going to active
  # you can run sql commands like this:
  # results = ActiveRecord::Base.connection.execute(query);
  # plugin: plugin model
  def gallery_on_active(plugin)
    generate_custom_field_gallery
  end

  # here all actions on going to inactive
  # plugin: plugin model
  def gallery_on_inactive(plugin)
  end

  # here all actions to upgrade for a new version
  # plugin: plugin model
  def gallery_on_upgrade(plugin)
  end

  def gallery_admin_before_load
     pt = current_site.post_types.hidden_menu.where(slug: "gallery").first
    if pt.present?
      items_i = []
      items_i << {icon: "list", title: t('plugin.gallery.all_galleries'), url: cama_admin_post_type_posts_path(pt.id)} if can? :posts, pt
      items_i << {icon: "plus", title: t('camaleon_cms.admin.post_type.add_new'), url: new_admin_plugins_gallery_gallery_path} if can? :create_post, pt
      if pt.manage_categories?
        items_i << {icon: "folder-open", title: t('camaleon_cms.admin.post_type.categories'), url: cama_admin_post_type_categories_path(pt.id)} if can? :categories, pt
      end
      if pt.manage_tags?
        items_i << {icon: "tags", title: t('camaleon_cms.admin.post_type.tags'), url: cama_admin_post_type_post_tags_path(pt.id)} if can? :post_tags, pt
      end

      items_i << {icon: "cogs", title: t('camaleon_cms.admin.button.settings'), url: admin_plugins_gallery_settings_path}

      admin_menu_insert_menu_after("content", "gallery", {icon: "camera", title: t('plugin.gallery.gallery'), url: "", items: items_i}) if items_i.present?
    end

    # add assets admin
    append_asset_libraries({gallery: {css: [plugin_gem_asset('admin')], js: [plugin_gem_asset('admin')]}})

  end

def get_gallery_post_type
  @gallery = current_site.post_types.hidden_menu.where(slug: "gallery").first
  unless @gallery.present?
    @gallery = current_site.post_types.hidden_menu.new(slug: "gallery", name: "Gallery")
    if @gallery.save
      @gallery.set_meta('_default', {
        has_category: true,
        has_tags: true,
        not_deleted: true,
        has_summary: true,
        has_content: true,
        has_comments: false,
        has_picture: true,
        has_template: false,
      })
      @gallery.categories.create({name: 'Uncategorized', slug: 'Uncategorized'.parameterize})
    end

  end

end

private
def generate_custom_field_gallery
  get_gallery_post_type
  unless @gallery.get_field_groups.where(slug: "plugin_gallery_node_data").present?
    @gallery.get_field_groups.destroy_all
    group = @gallery.add_custom_field_group({name: 'Galleries Details', slug: 'plugin_gallery_node_data'})
  end
end
end
