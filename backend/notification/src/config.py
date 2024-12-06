from dotenv import load_dotenv
from pydantic_settings import BaseSettings, SettingsConfigDict
import logging
from fastapi_mail import ConnectionConfig, FastMail

load_dotenv()


class MailConfig(BaseSettings):
    mail: str
    password: str
    port: int
    server: str
    tls: bool = True
    ssl: bool = False

    @property
    def connection(self):
        return ConnectionConfig(
            MAIL_USERNAME=self.mail,
            MAIL_PASSWORD=self.password,
            MAIL_FROM=self.mail,
            MAIL_PORT=self.port,
            MAIL_SERVER=self.server,
            MAIL_STARTTLS=self.tls,
            MAIL_SSL_TLS=self.ssl,
            TEMPLATE_FOLDER="src/templates/"
        )

    model_config = SettingsConfigDict(env_file='.env', extra='ignore', env_prefix='SMTP_')



class Settings(BaseSettings):
    rabbitmq_host: str
    rabbitmq_user: str
    rabbitmq_password: str

    @property
    def rabbitmq_url(self):
        return f"amqp://{self.rabbitmq_user}:{self.rabbitmq_password}@{self.rabbitmq_host}/"

    # redis_host: str

    smtp: MailConfig = MailConfig()

    model_config = SettingsConfigDict(env_file='.env')


settings = Settings()
fm = FastMail(settings.smtp.connection)

