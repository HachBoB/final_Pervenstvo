"""edit user rows

Revision ID: 4aa261fb5e25
Revises: bba8b3bce038
Create Date: 2024-12-07 01:00:20.900395

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '4aa261fb5e25'
down_revision: Union[str, None] = 'bba8b3bce038'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('users', 'number',
               existing_type=sa.BIGINT(),
               nullable=True)
    op.alter_column('users', 'last_name',
               existing_type=sa.VARCHAR(),
               nullable=True)
    op.alter_column('users', 'region',
               existing_type=sa.VARCHAR(),
               nullable=True)
    op.alter_column('users', 'is_man',
               existing_type=sa.BOOLEAN(),
               nullable=True)
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('users', 'is_man',
               existing_type=sa.BOOLEAN(),
               nullable=False)
    op.alter_column('users', 'region',
               existing_type=sa.VARCHAR(),
               nullable=False)
    op.alter_column('users', 'last_name',
               existing_type=sa.VARCHAR(),
               nullable=False)
    op.alter_column('users', 'number',
               existing_type=sa.BIGINT(),
               nullable=False)
    # ### end Alembic commands ###