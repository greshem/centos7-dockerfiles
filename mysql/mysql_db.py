#!/usr/bin/python
#server 
#docker run -p 3307:3306 -v /home/data/var/mysql/:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=tgbygv mysql
#client 
#mysql -P 3307  -h 127.0.0.1 -p 

def  get_mysql_session(db):
    from sqlalchemy import Column, ForeignKey, Integer, String, create_engine
    from sqlalchemy.orm import sessionmaker
    import ConfigParser


    config_read = ConfigParser.RawConfigParser()
    config_read.read('config.ini')
    mysql_server=config_read.get('global','mysql_server')
    mysql_user=config_read.get('global','mysql_user')
    mysql_port=config_read.get('global','mysql_port')
    mysql_pass=config_read.get('global','mysql_password')

    
    DB_CONNECT_STRING = 'mysql+mysqldb://%s:%s@%s:%s/%s?charset=utf8'%( mysql_user, mysql_pass, mysql_server,mysql_port, db);
    engine = create_engine(DB_CONNECT_STRING, echo=True)
    DB_Session = sessionmaker(bind=engine)
    session = DB_Session()
    return session;


if __name__=="__main__":
    session = get_mysql_session("mysql");
    for row in session.execute('select * from  user  ;').fetchall():
        row=dict(zip(row.keys(), row.values()));
        print row;
        #print row['User'],
        #print row['Password']


