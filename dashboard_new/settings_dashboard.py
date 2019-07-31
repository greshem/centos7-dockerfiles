# -*- coding:utf-8 -*-
WEBROOT='/'
LOGIN_URL=None
LOGOUT_URL=None
LOGIN_REDIRECT_URL=None
if not WEBROOT.endswith('/'):
    WEBROOT += '/'
if LOGIN_URL is None:
    LOGIN_URL = WEBROOT + 'auth/login/'
if LOGOUT_URL is None:
    LOGOUT_URL = WEBROOT + 'auth/logout/'
if LOGIN_REDIRECT_URL is None:
    LOGIN_REDIRECT_URL = WEBROOT
LOGIN_REDIRECT_URL='/project/index'

BILLING_BASE_URL="http://127.0.0.1:8081/v1.0/"
#BILLING_BASE_URL="http://192.168.100.155:8080/v1.0/"
#BILLING_BASE_URL= 'http://192.168.210.28:8080/v1.0/'
#BILLING_BASE_URL= 'http://192.168.210.35:6888/v1.0/'
#BILLING_BASE_URL= 'http://0.0.0.0:8081/v1.0/'
#BILLING_BASE_URL= 'http://192.168.210.35:6888/v1.0/'
#BILLING_BASE_URL= 'http://127.0.0.1:8080/v1.0/'
#BILLING_BASE_URL= 'http://localhost:8080/v1.0/'
#BILLING_BASE_URL= 'http://192.168.210.29:6888/v1.0/'

PAYMENT_URL="http://192.168.100.11:8000/payment/checkout"
HORIZON_URL="http://192.168.100.135:8090"
#OPENSTACK_HOST='127.0.0.1'
OPENSTACK_HOST='keystone'
NAAS_URL="http://192.168.210.29"
SUBACCOUT_URL="http://192.168.210.29"
HORIZON_HELP_URL="http://www.syscloud.cn/help/html/zhinan/jieshao/"
HORIZON_WO_URL="http://120.131.81.27/otrs/customer.pl"
MD5_KEY="ac092800-fc0"
SECRET_KEY = 'zXUBTIHfHmBEq6oUtWU7ZjagA2dKJuIx6a6ILXC8XIGBuCs050hnuTTB8X2NmuoC'
BASE_URL=""
TIME_ZONE="Asia/Shanghai"
LOG_BASE_URL = 'http://192.168.210.200:6889/v1.0'
GIFT_VALUE=10
#SESSION_COOKIE_DOMAIN='192.168.100.11:8001'
SESSION_COOKIE_NAME='sessionId'
#SESSION_COOKIE_DOMAIN = '192.168.100.11'
HOSTMANAGE=[
    'www.systest.net',
    'cloud.daily-tech.cn',
    'cloud.ynyun.cn'
]

#OPENSTACK_ENDPOINT_TYPE = "publicURL"
OPENSTACK_KEYSTONE_URL = "http://%s:5000/v3" % OPENSTACK_HOST
OPENSTACK_KEYSTONE_DEFAULT_ROLE = "_member_"
ADMINUSER={'name':'admin','password':'admin'}

OPENSTACK_API_VERSIONS = {
  'identity': 3,
}

QUOTA_DEFAULT ={
    'nova': {
              "ram": 4096,
               "instances": 4,
               "cores": 4
    },
    'cinder': {
        "volumes": 2,
        "snapshots": 2,
        "volume_gigabytes": 2000,
        "snapshot_gigabytes": 2000
    },
    'neutron': {
        "floatingip": 1,'pool':1, "network": 1, "port": 128, "router": 1, "subnet": 1, "bandwidth": 10
    }
}
DEFAULT_ROLE='user'
PARENT_ID='d43f82c4d4c6441597fc5ad846dad508'
DEFAULT_REGION_ID='RegionOne'
PROJECT_PARENT_ID='63ab084e34b34850852f1c2f98285a93'
#SESSION_COOKIE_NAME = 'business_session_id'

#LOGIN_URL=''
#LOGIN_REDIRECT_URL=''
CDNLIMIT=1
DEV= True

HORIZON_CONFIG={}
SECURITY_GROUP_RULES = {
    'all_tcp': {
        'name': 'All TCP',
        'ip_protocol': 'tcp',
        'from_port': '1',
        'to_port': '65535',
    },
    'all_udp': {
        'name': 'All UDP',
        'ip_protocol': 'udp',
        'from_port': '1',
        'to_port': '65535',
    },
    'all_icmp': {
        'name': 'All ICMP',
        'ip_protocol': 'icmp',
        'from_port': '-1',
        'to_port': '-1',
    },
    'ssh': {
        'name': 'SSH',
        'ip_protocol': 'tcp',
        'from_port': '22',
        'to_port': '22',
    },
    'smtp': {
        'name': 'SMTP',
        'ip_protocol': 'tcp',
        'from_port': '25',
        'to_port': '25',
    },
    'dns': {
        'name': 'DNS',
        'ip_protocol': 'tcp',
        'from_port': '53',
        'to_port': '53',
    },
    'http': {
        'name': 'HTTP',
        'ip_protocol': 'tcp',
        'from_port': '80',
        'to_port': '80',
    },
    'pop3': {
        'name': 'POP3',
        'ip_protocol': 'tcp',
        'from_port': '110',
        'to_port': '110',
    },
    'imap': {
        'name': 'IMAP',
        'ip_protocol': 'tcp',
        'from_port': '143',
        'to_port': '143',
    },
    'ldap': {
        'name': 'LDAP',
        'ip_protocol': 'tcp',
        'from_port': '389',
        'to_port': '389',
    },
    'https': {
        'name': 'HTTPS',
        'ip_protocol': 'tcp',
        'from_port': '443',
        'to_port': '443',
    },
    'smtps': {
        'name': 'SMTPS',
        'ip_protocol': 'tcp',
        'from_port': '465',
        'to_port': '465',
    },
    'imaps': {
        'name': 'IMAPS',
        'ip_protocol': 'tcp',
        'from_port': '993',
        'to_port': '993',
    },
    'pop3s': {
        'name': 'POP3S',
        'ip_protocol': 'tcp',
        'from_port': '995',
        'to_port': '995',
    },
    'ms_sql': {
        'name': 'MS SQL',
        'ip_protocol': 'tcp',
        'from_port': '1433',
        'to_port': '1433',
    },
    'mysql': {
        'name': 'MYSQL',
        'ip_protocol': 'tcp',
        'from_port': '3306',
        'to_port': '3306',
    },
    'rdp': {
        'name': 'RDP',
        'ip_protocol': 'tcp',
        'from_port': '3389',
        'to_port': '3389',
    },
}
OPENSTACK_NEUTRON_NETWORK = {
    'enable_router': True,
    'enable_quotas': True,
    'enable_ipv6': True,
    'enable_distributed_router': False,
    'enable_ha_router': False,
    'enable_lb': True,
    'enable_firewall': True,
    'enable_vpn': True,
    'enable_fip_topology_check': True,

    'profile_support': None,
    #'profile_support': 'cisco',
    # 'segmentation_id_range': {
    #     'vlan': [1024, 2048],
    #     'vxlan': [4094, 65536],
    # },

    # 'extra_provider_types': {
    #     'awesome_type': {
    #         'display_name': 'Awesome New Type',
    #         'require_physical_network': False,
    #         'require_segmentation_id': True,
    #     }
    # },

    'supported_vnic_types': ['*'],
}

LOGGING = {
    'version': 1,
    # When set to True this will disable all logging except
    # for loggers specified in this configuration dictionary. Note that
    # if nothing is specified here and disable_existing_loggers is True,
    # django.db.backends will still log unless it is disabled explicitly.
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': '%(asctime)s %(process)d %(levelname)s %(name)s '
                      '%(message)s'
        },
        'normal': {
            'format': 'dashboard-%(name)s: %(levelname)s %(message)s'
        },
    },
    'handlers': {
        'null': {
            'level': 'DEBUG',
            'class': 'django.utils.log.NullHandler',
        },
        'console': {
            # Set the level to "DEBUG" for verbose output logging.
            #'level': 'DEBUG',
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
        },
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/httpd/horizon_greshem.log',
            'formatter': 'verbose',
        },
       
    },
    'loggers': {
        # Logging from django.db.backends is VERY verbose, send to null
        # by default.
        'django.db.backends': {
            'handlers': ['null'],
            'propagate': False,
        },
        'requests': {
            'handlers': ['null'],
            'propagate': False,
        },
        'horizon': {
            # 'handlers': ['console'],
            'handlers': ['file'],
            # 'level': 'DEBUG',
            'level': 'DEBUG',
            'propagate': False,
        },
        'openstack_dashboard': {
            # 'handlers': ['console'],
            'handlers': ['file'],
            # 'level': 'DEBUG',
            'level': 'DEBUG',
            'propagate': False,
        },
        'novaclient': {
            # 'handlers': ['console'],
            #'handlers': ['file'],
            # 'level': 'DEBUG',
            'level': 'INFO',
            'propagate': False,
        },
        'cinderclient': {
            # 'handlers': ['console'],
            'handlers': ['file'],
            # 'level': 'DEBUG',
            'level': 'DEBUG',
            'propagate': False,
        },
        'keystoneclient': {
             'handlers': ['console'],
            #'handlers': ['file'],
             'level': 'DEBUG',
            #'level': 'DEBUG',
            'propagate': False,
        },
        'glanceclient': {
            # 'handlers': ['console'],
            'handlers': ['file'],
            # 'level': 'DEBUG',
            'level': 'DEBUG',
            'propagate': False,
        },
        'neutronclient': {
            # 'handlers': ['console'],
            'handlers': ['file'],
            # 'level': 'DEBUG',
            'level': 'DEBUG',
            'propagate': False,
        },
        'heatclient': {
            # 'handlers': ['console'],
            'handlers': ['file'],
            # 'level': 'DEBUG',
            'level': 'DEBUG',
            'propagate': False,
        },
        'ceilometerclient': {
            # 'handlers': ['console'],
            'handlers': ['file'],
            # 'level': 'DEBUG',
            'level': 'DEBUG',
            'propagate': False,
        },
        'troveclient': {
            # 'handlers': ['console'],
            'handlers': ['file'],
            # 'level': 'DEBUG',
            'level': 'DEBUG',
            'propagate': False,
        },
        'swiftclient': {
            # 'handlers': ['console'],
            'handlers': ['file'],
            # 'level': 'DEBUG',
            'level': 'DEBUG',
            'propagate': False,
        },
        'openstack_auth': {
             'handlers': ['console'],
            'handlers': ['file'],
             'level': 'DEBUG',
            #'level': 'DEBUG',
            'propagate': False,
        },
        'nose.plugins.manager': {
            # 'handlers': ['console'],
            'handlers': ['file'],
            # 'level': 'DEBUG',
            'level': 'DEBUG',
            'propagate': False,
        },
        'django': {
            # 'handlers': ['console'],
            'handlers': ['file'],
            # 'level': 'DEBUG',
            'level': 'DEBUG',
            'propagate': False,
        },
    }
}


PAGE_CACHE_TIMEOUT = 300
