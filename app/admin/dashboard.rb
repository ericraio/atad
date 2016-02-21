ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content do
    columns do
      column do
        panel 'User Signups' do
          line_chart(User.group_by_day(:created_at).count)
        end
      end

      column do
        panel 'Admin Activity' do
          table_for PaperTrail::Version.order('id desc').limit(10) do # Use PaperTrail::Version if this throws an error
            column("Item") { |v|
              next unless v.item
              link_to("#{v.item.class} #{v.item.id}", v.item.admin_permalink)
            }
            column("Type") { |v| v.item_type.underscore.humanize }
            column("Modified at") { |v| v.created_at.to_s :long }

            column("Admin") { |item|
              next unless item.whodunnit
              au = AdminUser.find(item.whodunnit)
              link_to("#{au.first_name} #{au.last_name}", [:admin, au])
            }
          end
        end
      end
    end

    columns do
      column do
        panel 'Email Activity' do
          line_chart([
            { name: 'Emails Sent', data: Ahoy::Message.group_by_day(:sent_at).count },
            { name: 'Emails Opened', data: Ahoy::Event.where(name: "Email Opened").group_by_day(:time).count },
            { name: 'Emails Clicked', data: Ahoy::Event.where(name: "Email Clicked").group_by_day(:time).count }
          ])
        end
      end
    end

  end

end
