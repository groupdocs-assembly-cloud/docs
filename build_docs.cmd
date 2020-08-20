call git submodule update --init --recursive docs-cloud-common
call git submodule foreach git pull origin master
rmdir docs-cloud-common\content\assembly /s /q
xcopy content docs-cloud-common\content /s /e /Y
cd docs-cloud-common
call hugo server  
