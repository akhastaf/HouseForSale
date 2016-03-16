class Contact < MailForm::Base
  attribute :name,        :validate => true
  attribute :email,       :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,     :validate =>  true
  attribute :nikename,    :captcha  => true

  def headers
    {
      :subject => "Contact Form",
      :to => "Abderrazzaq@khastaf.me",
      :from => %("#{name}" <#{email}>)
    }
  end
end
