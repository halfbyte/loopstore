
class MailReceiver < ActionMailer::Base
  def receive(mail)
    receiver = mail.header_string("Delivered-To")
    #loopstore+1Pu051i9j0@googlemail.com
    parts = receiver.match(/^loopstore\+(\d+)([Pp])([a-zA-Z0-9]{8})\@googlemail\.com$/)
    return if parts.nil?
    user_id = parts[1]
    is_private = parts[2] == 'P'
    drop = parts[3]
    user = User.find_by_id(user_id)
    return unless user
    return if user.send("mail_drop_#{is_private ? 'private' : 'public'}".to_sym) != drop

    return if !mail.multipart?
    html_part = mail.parts.select{|part| part.content_type == 'text/html'}.first
    doc = Hpricot(html_part.body)
    return if doc.nil?
    link = doc.at("a")
    return if link.nil?
    link_contents = link.inner_html
    name_match = link_contents.match(/^nanoloop: (.*?\.nan)$/)
    return if name_match.nil?

    name = name_match[1]
    data = link['href']

    user.loops.create(:name => name, :data => data, :public => !is_private)

  end

end
