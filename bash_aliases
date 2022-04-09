alias bashrc="sudo nano ~/.bashrc"
alias ebash="source ~/.bashrc"

alias sin="sudo apt install "
alias sup="sudo apt update "
alias srm="sudo apt autoremove"
alias apache_restart="sudo apachectl restart"
alias apache_reload="sudo apachectl reload"

alias gp="git push -u luong HEAD"
alias gpo="git pull origin"
alias gpod="git pull origin develop"
alias gpom="git pull origin master"
alias gcmp="git checkout master && git pull origin master"
alias gpof="git push -f origin HEAD"
alias git_push="git add -A . && git commit --amend --no-edit && git push -f luong"
alias git_rebase="git checkout develop && git pull origin develop && git checkout - && git rebase develop"
alias gpfd="git pull origin develop && php artisan migrate"
alias ga="git add -A ."
alias gae="git add -u && git reset -- src/vincart-common/adapters/evoucher_adapter.go src/vincart-common/adapters/evoucher_sap_adapter.go  src/vincart-mobile/conf/app.conf src/vincart-service/conf/app.conf src/vincart-consumer/.env src/vincart-common/adapters/evoucher_sap_adapter_local.go src/vincart-mobile/services/order_service.go"

alias gb="git branch --sort=-committerdate"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gbs="git branch --sort=committerdate"

alias gchd="git checkout develop"
alias gchm="git checkout master"

alias gcm="git add -A . && git commit -m"
alias gcme="git add -A . && git reset -- src/vincart-common/adapters/evoucher_adapter.go src/vincart-common/adapters/evoucher_sap_adapter.go  src/vincart-mobile/conf/app.conf src/vincart-service/conf/app.conf src/vincart-consumer/.env src/vincart-common/adapters/evoucher_sap_adapter_local.go && git commit -m"
alias gca="git add . && git commit --amend --no-edit"
alias gc="git checkout"
alias gcd="git checkout develop && git pull origin develop"
alias gcb="git checkout -b"
alias gcp="git checkout -"
alias gcr="git checkout --"

alias gd="git diff"
alias gs="git status"
alias gl="git log --oneline -10"
alias gf="git fetch"
alias gr="git reset"
alias grs="git reset --soft HEAD~"
alias grh="git reset --hard"
alias grd="git rebase develop"
alias grc="git rebase --continue"
alias gra="git rebase --abort"

alias pa="php artisan"
alias pam="php artisan migrate"
alias par="php artisan migrate:rollback"
alias pat="php artisan ti"

alias laravel_init="composer create-project --prefer-dist laravel/laravel"
alias vue_init="vue init webpack"
alias unittest="phpunit --coverage-html coverages"
alias sau="sudo apt-get autoremove"
alias sni="sudo npm install"
alias init_project="composer install && php artisan migrate && sudo npm install && gulp"
alias awesome="cd /Library/WebServer/Documents/awesome_teacher"
alias phpunit="php -dzend_extension=xdebug.so /Library/WebServer/Documents/awesome_teacher/vendor/bin/phpunit"
alias awesome_check="phpcs --standard=Framgia --encoding=utf-8 /Library/WebServer/Documents/awesome_teacher/app/ && eslint /Library/WebServer/Documents/awesome_teacher/resources/assets/js/ && phpunit --coverage-html coverages"
alias gulp_watch="rm -r public/build/ && gulp watch"
alias apa="cd /etc/apache2"
alias sites="cd /etc/apache2/sites-available"
alias hosts="sudo subl /etc/hosts"


# docker
alias dp="docker ps"
alias dpa="docker ps -a"
alias de="docker exec -it"
alias dl="docker logs -n 20"  
alias di="docker images"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dup="docker-compose up -d"
alias dupb="docker-compose up -d --build"
alias ddown="docker-compose down --remove-orphans"
alias dc="docker container"
alias dcrm="docker container rm"
alias dcs="docker container stop"
alias dcr="docker container restart"


#apache
alias apache_disable="sudo update-rc.d apache2 disable"
alias apache_enable="sudo update-rc.d apache2 enable"

#jmeter
alias jmeter="open /usr/local/bin/jmeter"

#mysql
alias mysql="/usr/local/mysql/bin/mysql"
alias mysql_restart="sudo /usr/local/mysql/support-files/mysql.server restart"
alias mysql_start="sudo /usr/local/mysql/support-files/mysql.server start"
alias mysql_stop="sudo /usr/local/mysql/support-files/mysql.server stop"

# kubenetes
alias ku="kubectl -n uat"
alias kuc="kubectl -n uat get configmap -o yaml"
alias kus="kubectl -n uat get secret -o yaml"

