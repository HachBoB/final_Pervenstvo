import uuid

from fastapi import Depends, HTTPException
from fastapi.security import OAuth2PasswordBearer
import jwt

from src.rabbitMq.timetable import RabbitMQClient
from src.rabbitMq.token import RabbitMQClientRPC as tokenRPC
from src.rabbitMq.district import RabbitMQClientRPC as districtRPC

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="https://mihest.ru/api/AccService/Authentication/SignIn")


async def validate_token(token: str = Depends(oauth2_scheme)):
    rabbitmq = tokenRPC()
    response: bool | str = await rabbitmq.call(token)
    if response is True:
        return token
    else:
        raise HTTPException(status_code=401, detail=response)


async def get_current_user(token: str = Depends(validate_token)):
    decoded = jwt.decode(
        token, options={"verify_signature": False}
    )
    return decoded


async def get_current_admin(user: dict = Depends(get_current_user)):
    if "Admin" != user.get('role'):
        raise HTTPException(status_code=403, detail="Not enough privileges.")
    return user


async def get_current_super_admin(user: dict = Depends(get_current_user)):
    if "Super admin" != user.get('role'):
        raise HTTPException(status_code=403, detail="Not enough privileges.")
    return user


async def delete_timetable_hospital(hospital_id: uuid.UUID):
    rabbitmq = RabbitMQClient()
    await rabbitmq.call(hospital_id)


async def validate_district(district_id: uuid.UUID):
    rabbitmq = districtRPC()
    response: bool = await rabbitmq.call(district_id)
    if not response:
        raise HTTPException(status_code=400, detail="District does not exist")
