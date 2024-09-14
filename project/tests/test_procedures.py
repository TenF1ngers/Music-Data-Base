import os
import pytest
from . import execute_sql_to_df
from . import read_sql


@pytest.fixture()
def select_script():
    path = os.getenv("SCRIPT_PATH")
    return read_sql(path)


@pytest.fixture()
def select_df(select_script, sqlalchemy_conn):
    return execute_sql_to_df(
        conn=sqlalchemy_conn,
        sql=select_script
    )


def test(select_df):
    if select_df['table_name'][0] == 'songs':
        assert select_df.shape[0] == 2
        assert select_df.query('auditions.isnull()').shape[0] == 0
        assert select_df.query('auditions == 100')['title'].iloc[0] == 'Winning Smile'
    else:
        assert select_df.shape[0] == 75
        assert select_df.loc[74, 'user_login'] == 'ivangorbunov07'
