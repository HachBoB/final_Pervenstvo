import uuid
from typing import List, Optional
from pydantic import BaseModel


class RoleSchema(BaseModel):
    id: int
    name: str


class UserBase(BaseModel):
    username: str


class UserDb(BaseModel):
    id: uuid.UUID
    username: str
    roles: list[RoleSchema]

    model_config = {'from_attributes': True}


class UserCreate(UserBase):
    username: str
    password: str


class UserCreateAdmin(UserCreate):
    roles: List[str]


class UserCreateDB(BaseModel):
    username: str
    hashed_password: str
    roles: Optional[List[str]] = None


class UserUpdate(BaseModel):
    password: str


class UserUpdateAdmin(UserUpdate):
    username: str
    roles: List[str]


class UserUpdateDB(BaseModel):
    username: Optional[str] = None
    hashed_password: str
    roles: Optional[List[str]] = None


class ResponseDoctor(BaseModel):
    id: uuid.UUID


