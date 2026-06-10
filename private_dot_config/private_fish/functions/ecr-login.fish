function ecr-login
    set --local ACCOUNT_ID (aws sts get-caller-identity --query Account --output text)
    aws ecr get-login-password --region us-east-1 | podman login \
              --username AWS \
              --password-stdin \
              $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com
end
