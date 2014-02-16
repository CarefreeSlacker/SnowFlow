ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true

ActionMailer::Base.smtp_settings = {
    address:              'smtp.yandex.ru',
    port:                 465,
    domain:               'yandex.ru',
    user_name:            'raggamer101',
    password:             'inthecornersc',
    authentication:       'plain',
    enable_starttls_auto: true
}