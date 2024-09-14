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
    if select_df['table_name'][0] == 'favourite_genres':
        assert select_df.shape[0] == 10
        assert select_df.query("genre == 'Pop music'").shape[0] == 0
        assert select_df.query("genre == 'Hip hop'").shape[0] == 10
    elif select_df['table_name'][0] == 'ranking_songs':
        assert select_df.shape[0] == 21
        assert select_df.query("rank.isnull()").shape[0] == 11
        assert select_df.query("auditions > 60").shape[0] == 4
        for i in range(9):
            assert select_df.loc[i + 1, 'auditions'] > select_df.loc[i, 'auditions']
    elif select_df['table_name'][0] == 'subs_data':
        assert select_df.shape[0] == 16
        assert select_df.query("valid_to.isnull()").shape[0] == 2
        for i in range(select_df.shape[0]):
            assert '********' in select_df.loc[i, 'masked_login']
    elif select_df['table_name'][0] == 'subs_usage':
        assert select_df.shape[0] == 6
        assert select_df.query("cnt.isnull()").shape[0] == 5
        assert select_df.query("cnt.notnull()")['cnt'].iloc[0] == 2
        assert select_df.query("cnt.notnull()")['title'].iloc[0] == 'Premium'
        for i in range(select_df.shape[0] - 1):
            assert select_df.loc[i + 1, 'id'] > select_df.loc[i, 'id']
    elif select_df['table_name'][0] == 'users_data':
        assert select_df.shape[0] == 10
        for i in range(select_df.shape[0]):
            assert '************************' in select_df.loc[i, 'masked_p_hash']
            assert '*********' in select_df.loc[i, 'masked_email']
            assert '******' in select_df.loc[i, 'masked_phone']
    elif select_df['table_name'][0] == 'usr_location':
        assert select_df.shape[0] == 10
        for i in range(select_df.shape[0]):
            assert '********' in select_df.loc[i, 'masked_login']
        assert select_df.query("country == 'Russia'").shape[0] == 9
