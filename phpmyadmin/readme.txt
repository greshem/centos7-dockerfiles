# 配置文件 需要注意的 几个配置 参数: 

"注意 认证模式: " 
cfg['Servers'][i]['auth_type']     = 'cookie';    
cfg['Servers'][i]['auth_type']     = 'config';    
cfg['Servers'][i]['auth_type']     = 'http';      
$cfg['Servers'][$i]['host']          = '172.16.8.117'; // MySQL hostname or IP address

$cfg['Servers'][$i]['auth_type']     = 'config';    // Authentication method (config, http or cookie based)?


