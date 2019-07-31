import sys;
import MySQLdb
import MySQLdb.cursors
import json;

insert_template_1 = """INSERT INTO %s VALUES """
insert_template_2 = """('%(id)s','%(name)s',%(number)d,%(small_number)d,'%(embedded)s');"""


create_db_command = """
    CREATE  database  test;
    """


create_table_command = """
    CREATE TABLE userinfo (id char(64) primary key, name char(128), number int, small_number int, embedded text);
    """



def create_database_table():
    try:
        #db = MySQLdb.connect(db="test", user="root", passwd="tgbygv",port=3307, host='192.168.1.48', cursorclass=MySQLdb.cursors.DictCursor)
        db = MySQLdb.connect( user="root", passwd="tgbygv",port=3307, host='192.168.1.48', cursorclass=MySQLdb.cursors.DictCursor)
    except:
        info=sys.exc_info()
        print info[0],":",info[1]
        print("%s:%s"%(info[0], info[1]));
        raise  Exception (" connect error \n");

    cursor = db.cursor()
    
    #cursor.execute(create_db_command);
    cursor.execute("use test");
    cursor.execute(create_table_command )



def delete_database(self):
        self.cursor.execute("DROP TABLE %s;" % self.db_name)



def default_generator():
    return {
        "id":  uuid.uuid4().hex,
        "name": uuid.uuid4().hex.upper(),
        "number": random.randint(1, 1000000000),
        "small_number": random.randint(1, 20),
        "embedded": {
            "inner_name": uuid.uuid4().hex.upper(),
            "inner_number": random.randint(1, 1000000000),
            "inner_small_number": random.randint(1, 20),
            "inner_fixed_name": "Bob",
        },
    }
import random
import uuid


def create_record( cursor, record):
        for key, value in record.items():
            if isinstance(value, dict):
                record[key] = json.dumps(value)
        #print  (insert_template_1 % "test") + (insert_template_2 % record);
        return cursor.execute((insert_template_1 % "userinfo") + (insert_template_2 % record))




if __name__=="__main__":
    #create_database_table();
    db = MySQLdb.connect( user="root", passwd="tgbygv",port=3307, host='192.168.1.48', cursorclass=MySQLdb.cursors.DictCursor)
    cursor = db.cursor()
    cursor.execute("use test");

    for each in  range(1,10000000):
        if each %10000==0:
            print each;
        a=default_generator();
        sql_str= create_record(cursor, a);
