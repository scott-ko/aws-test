# Caller
* EC2 instance
* Instance profile
* Role (arn:aws:iam::xxx:role/CallerRole)

# Callee
* Role (arn:aws:iam::xxx:role/WhoAmIRole)

# Commands
SshCidr=0.0.0.0/0 RemoteRoleARN=arn:aws:iam::${account1:?}:role/WhoAmIRole create-caller.sh

RemoteCallerRoleARN=arn:aws:iam::${account2:?}:role/CallerRole create-callee.sh

# Findings

## You can associate only one role to an instance profile.
ref http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html#cfn-iam-instanceprofile-roles
