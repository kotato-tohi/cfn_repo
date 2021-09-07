#!/bin/sh
 
# StackName=${PREFIX_NAME}-${SYSTEM_NAME}-${SUFFIX_NAME}
PREFIX_NAME=
SYSTEM_NAME=
SUFFIX_NAME=

NETWORK_TEMPLATE_YML=./aurora-sample.yml
DB_USERNAME=
DB_PASSWOED=

# SECURITY_TEMPLATE_YML=./security/security.yml
# WEB_TEMPLATE_YML=./web/web.yml


function usage {
  cat <<EOM
Usage: $(basename "$0") [OPTION]...
  -h          Display help
  -c          create-stack
  -d          delete-stack
  -u          update-stack
EOM

  exit 2
}


function usage2 {
  cat <<EOM
Usage: $(basename "$0") [OPTION]...
  -h          Display help
  -c          create-stack
  -d          delete-stack
  -u          update-stack
EOM

  exit 2
}



while getopts cdu optKey; do
  case "$optKey" in
    c)
      aws cloudformation deploy --template-file $NETWORK_TEMPLATE_YML --stack-name $PREFIX_NAME-network-$SUFFIX_NAME --parameter-overrides `cat parameters.properties`
      # aws cloudformation deploy --template-file $SECURITY_TEMPLATE_YML --stack-name security-$STACK_NAME --capabilities CAPABILITY_NAMED_IAM --parameter-overrides `cat parameters.properties`
      # aws cloudformation deploy --template-file $WEB_TEMPLATE_YML --stack-name web-$STACK_NAME --parameter-overrides `cat parameters.properties`
      ;;
    d)
    #   delete_stack
      # aws cloudformation delete-stack --stack-name web-$STACK_NAME
      # aws cloudformation wait stack-delete-complete  --stack-name web-$STACK_NAME
      # aws cloudformation delete-stack --stack-name security-$STACK_NAME
      # aws cloudformation wait stack-delete-complete  --stack-name security-$STACK_NAME
      # aws cloudformation delete-stack --stack-name network-$STACK_NAME
      # aws cloudformation wait stack-delete-complete  --stack-name network-$STACK_NAME

      # aws cloudformation describe-stacks
      ;;
    u)
      # aws cloudformation update-stack --stack-name network-$STACK_NAME --template-body $NETWORK_TEMPLATE_YML
      ;;
    '-h'|'--help'|* )
      usage
      ;;
  esac
done