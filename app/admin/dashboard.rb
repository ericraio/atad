ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: "Recently updated content" do
    table_for PaperTrail::Version.order('id desc').limit(20) do # Use PaperTrail::Version if this throws an error
      column("Item") { |v| link_to "#{v.item.class} #{v.item.id}", v.item.admin_permalink }
      column("Type") { |v| v.item_type.underscore.humanize }
      column("Modified at") { |v| v.created_at.to_s :long }
      column("Admin") { |v|
        au = AdminUser.find(v.whodunnit)
        link_to("#{au.first_name} #{au.last_name}", [:admin, au])
      }
    end
  end

end
