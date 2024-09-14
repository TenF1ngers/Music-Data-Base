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
    if select_df['table_name'][0] == 'add_track_bro':
        assert select_df.shape[0] == 74
        assert select_df.loc[8, 'prev_song'] is None
        assert select_df.loc[1, 'prev_song'] == 'Мы все умрём'
        for i in range(select_df.shape[0] - 1):
            assert select_df.loc[i + 1, 'user_login'] >= select_df.loc[i, 'user_login']
    elif select_df['table_name'][0] == 'famous_song':
        assert select_df.shape[0] == 10
        assert select_df.loc[5, 'title'] == 'Эминем'
        for i in range(select_df.shape[0]):
            assert select_df.loc[i, 'likes'] is not None
    elif select_df['table_name'][0] == 'more_auditions':
        assert select_df.shape[0] == 4
        assert select_df.loc[0, 'title'] == 'Blood is Rebel'
        assert select_df.loc[3, 'title'] == 'Красота и уродство'
        for i in range(select_df.shape[0]):
            assert len(select_df.loc[i, 'title']) <= 18
    elif select_df['table_name'][0] == 'paid':
        assert select_df.shape[0] == 2
        assert select_df.loc[0, 'user_login'] == 'ivangorbunov07'
        assert select_df.loc[1, 'user_login'] == 'designer'
    elif select_df['table_name'][0] == 'perform_conquest':
        assert select_df.shape[0] == 12
        for i in range(select_df.shape[0] - 1):
            assert select_df.loc[i + 1, 'rank'] >= select_df.loc[i, 'rank']
        assert select_df.loc[10, 'rank'] == 8
        assert select_df.loc[1, 'name'] == 'Billi Eilish'
    elif select_df['table_name'][0] == 'track_ranking':
        assert select_df.shape[0] == 10
        for i in range(select_df.shape[0] - 1):
            assert select_df.loc[i + 1, 'rank'] > select_df.loc[i, 'rank']
        assert select_df.loc[0, 'title'] == 'Красота и уродство'
        assert select_df.loc[2, 'sum_aud'] == 63
