  class ContactMailer < ApplicationMailer
    default from: 'from@example.com'

    def contact_mail(email, team)
        @email = email
        @team = team
        mail to: @email, subject: "#{@team.name}のリーダー権を付与されました！"
    end
end
  