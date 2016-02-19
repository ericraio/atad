admin_user = AdminUser.create(email: 'admin@example.com', first_name: 'John', last_name: 'Smith', password: 'password', password_confirmation: 'password')
User.create(email: 'ericraio@gmail.com')
tip = Tip.create(subject: 'How to avoid a stomach ache', body: "Don't eat yellow snow")
version = tip.versions.first
version.whodunnit = admin_user.id
version.save!
