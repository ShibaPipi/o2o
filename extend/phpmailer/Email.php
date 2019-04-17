<?php
/**
 * 发送邮件类库
 */

namespace phpmailer;

class Email
{
    /**
     * @param $to
     * @param $title
     * @param $content
     * @return bool
     */
    public static function send($to, $title, $content)
    {
        if (empty($to)) return false;
        date_default_timezone_set('PRC');//set time
        try {
            //Create a new PHPMailer instance
            $mail = new PHPMailer;
            //Tell PHPMailer to use SMTP
            $mail->isSMTP();
            //Enable SMTP debugging
            // 0 = off (for production use)
            // 1 = client messages
            // 2 = client and server messages
            //$mail->SMTPDebug = 2;   //用的时候这个应该注释  不然会输出代码
            //Ask for HTML-friendly debug output
            $mail->Debugoutput = 'html';
            //Set the hostname of the mail server
            $mail->Host = config('mail.host');                   //发送者使用的邮件服务器
            //Set the SMTP port number - likely to be 25, 465 or 587
            $mail->Port = config('mail.port');
            //Whether to use SMTP authentication
            $mail->SMTPAuth = true;
            //Username to use for SMTP authentication
            $mail->Username = config('mail.username');           //发送者邮箱
            //Password to use for SMTP authentication
            $mail->Password = config('mail.password');             //客户端授权密码
            //Set who the message is to be sent from
            $mail->setFrom(config('mail.username'), '皮神');  //发送者邮箱
            //Set an alternative reply-to address
            //$mail->addReplyTo('replyto@example.com', 'First Last');
            //Set who the message is to be sent to
            $mail->addAddress($to, $to);   //邮件接收者邮箱
            //Set the subject line
            $mail->Subject = $title;                            //发送邮件标题
            //Read an HTML message body from an external file, convert referenced images to embedded,
            //convert HTML into a basic plain-text alternative body
            $mail->msgHTML($content);                             //发送邮件正文
            //Replace the plain text body with one created manually
            //$mail->AltBody = 'This is a plain-text message body';
            //Attach an image file
            //$mail->addAttachment('images/phpmailer_mini.png');
            //send the message, check for errors
            if (!$mail->send()) {
                return false;
//                echo "Mailer Error: " . $mail->ErrorInfo;
            } else {
                return true;
//                echo "Message sent success!";
            }
        } catch (phpmailerException $e) {
            return false;
        }

    }
}