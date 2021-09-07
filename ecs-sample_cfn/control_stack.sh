#!/bin/sh
PREFIX_NAME=
SYSTEM_NAME=
SUFFIX_NAME=
TEMPLATE_FILE=./ecs_sample_cfn.yml



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
      aws cloudformation deploy --template-file $TEMPLATE_FILE --stack-name $PREFIX_NAME-$SYSTEM_NAME-$SUFFIX_NAME --parameter-overrides `cat exec_parameters.properties`
      ;;
    d)
    #   delete_stack
      aws cloudformation delete-stack --stack-name $PREFIX_NAME-$SYSTEM_NAME-$SUFFIX_NAME
      aws cloudformation wait stack-delete-complete  --stack-name $PREFIX_NAME-$SYSTEM_NAME-$SUFFIX_NAME
      aws cloudformation describe-stacks
      ;;
    u)
      # aws cloudformation update-stack --stack-name network-$STACK_NAME --template-body $NETWORK_TEMPLATE_YML
      ;;
    '-h'|'--help'|* )
      usage
      ;;
  esac
done