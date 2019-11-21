class ContactMailer < ApplicationMailer
    default from: 'nil.admirari1009@gmail.com'

    def contact_mail(email, team)
        @email = email
        @team = team
        mail to: @email, subject: "#{@team.name}のリーダー権が譲渡されました。"
    end

    def agenda_delete_mail(email, title)
      @email = email
      @title = title
      mail to: @email, subject: "#{title}が削除されました。"
    end
  end