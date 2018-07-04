# README

<p>Step to install:<p>
``` bundle install ```

<p>Then put your email and password inside <b><i>config/environments/development.rb</i></b></p>

```
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'localhost',
  user_name:            'example@gmail.com',
  password:             'password',
  authentication:       'plain',
  enable_starttls_auto: true 
}
```