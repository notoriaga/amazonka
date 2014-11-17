{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.RunInstances
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Launches the specified number of instances using an AMI for which you have
-- permissions. When you launch an instance, it enters the pending state.
-- After the instance is ready for you, it enters the running state. To check
-- the state of your instance, call DescribeInstances. If you don't specify a
-- security group when launching an instance, Amazon EC2 uses the default
-- security group. For more information, see Security Groups in the Amazon
-- Elastic Compute Cloud User Guide. Linux instances have access to the public
-- key of the key pair at boot. You can use this key to provide secure access
-- to the instance. Amazon EC2 public images use this feature to provide
-- secure access without passwords. For more information, see Key Pairs in the
-- Amazon Elastic Compute Cloud User Guide. You can provide optional user data
-- when launching an instance. For more information, see Instance Metadata in
-- the Amazon Elastic Compute Cloud User Guide. If any of the AMIs have a
-- product code attached for which the user has not subscribed, RunInstances
-- fails. T2 instance types can only be launched into a VPC. If you do not
-- have a default VPC, or if you do not specify a subnet ID in the request,
-- RunInstances fails. For more information about troubleshooting, see What To
-- Do If An Instance Immediately Terminates, and Troubleshooting Connecting to
-- Your Instance in the Amazon Elastic Compute Cloud User Guide.
--
-- <RunInstances.html>
module Network.AWS.EC2.RunInstances
    (
    -- * Request
      RunInstances
    -- ** Request constructor
    , runInstances
    -- ** Request lenses
    , riAdditionalInfo
    , riBlockDeviceMappings
    , riClientToken
    , riDisableApiTermination
    , riDryRun
    , riEbsOptimized
    , riIamInstanceProfile
    , riImageId
    , riInstanceInitiatedShutdownBehavior
    , riInstanceType
    , riKernelId
    , riKeyName
    , riMaxCount
    , riMinCount
    , riMonitoring
    , riNetworkInterfaces
    , riPlacement
    , riPrivateIpAddress
    , riRamdiskId
    , riSecurityGroupIds
    , riSecurityGroups
    , riSubnetId
    , riUserData

    -- * Response
    , RunInstancesResponse
    -- ** Response constructor
    , runInstancesResponse
    -- ** Response lenses
    , rirGroups
    , rirInstances
    , rirOwnerId
    , rirRequesterId
    , rirReservationId
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.EC2.Types
import qualified GHC.Exts

data RunInstances = RunInstances
    { _riAdditionalInfo                    :: Maybe Text
    , _riBlockDeviceMappings               :: [BlockDeviceMapping]
    , _riClientToken                       :: Maybe Text
    , _riDisableApiTermination             :: Maybe Bool
    , _riDryRun                            :: Maybe Bool
    , _riEbsOptimized                      :: Maybe Bool
    , _riIamInstanceProfile                :: Maybe IamInstanceProfileSpecification
    , _riImageId                           :: Text
    , _riInstanceInitiatedShutdownBehavior :: Maybe Text
    , _riInstanceType                      :: Maybe Text
    , _riKernelId                          :: Maybe Text
    , _riKeyName                           :: Maybe Text
    , _riMaxCount                          :: Int
    , _riMinCount                          :: Int
    , _riMonitoring                        :: Maybe RunInstancesMonitoringEnabled
    , _riNetworkInterfaces                 :: [InstanceNetworkInterfaceSpecification]
    , _riPlacement                         :: Maybe Placement
    , _riPrivateIpAddress                  :: Maybe Text
    , _riRamdiskId                         :: Maybe Text
    , _riSecurityGroupIds                  :: [Text]
    , _riSecurityGroups                    :: [Text]
    , _riSubnetId                          :: Maybe Text
    , _riUserData                          :: Maybe Text
    } deriving (Eq, Show, Generic)

-- | 'RunInstances' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'riAdditionalInfo' @::@ 'Maybe' 'Text'
--
-- * 'riBlockDeviceMappings' @::@ ['BlockDeviceMapping']
--
-- * 'riClientToken' @::@ 'Maybe' 'Text'
--
-- * 'riDisableApiTermination' @::@ 'Maybe' 'Bool'
--
-- * 'riDryRun' @::@ 'Maybe' 'Bool'
--
-- * 'riEbsOptimized' @::@ 'Maybe' 'Bool'
--
-- * 'riIamInstanceProfile' @::@ 'Maybe' 'IamInstanceProfileSpecification'
--
-- * 'riImageId' @::@ 'Text'
--
-- * 'riInstanceInitiatedShutdownBehavior' @::@ 'Maybe' 'Text'
--
-- * 'riInstanceType' @::@ 'Maybe' 'Text'
--
-- * 'riKernelId' @::@ 'Maybe' 'Text'
--
-- * 'riKeyName' @::@ 'Maybe' 'Text'
--
-- * 'riMaxCount' @::@ 'Int'
--
-- * 'riMinCount' @::@ 'Int'
--
-- * 'riMonitoring' @::@ 'Maybe' 'RunInstancesMonitoringEnabled'
--
-- * 'riNetworkInterfaces' @::@ ['InstanceNetworkInterfaceSpecification']
--
-- * 'riPlacement' @::@ 'Maybe' 'Placement'
--
-- * 'riPrivateIpAddress' @::@ 'Maybe' 'Text'
--
-- * 'riRamdiskId' @::@ 'Maybe' 'Text'
--
-- * 'riSecurityGroupIds' @::@ ['Text']
--
-- * 'riSecurityGroups' @::@ ['Text']
--
-- * 'riSubnetId' @::@ 'Maybe' 'Text'
--
-- * 'riUserData' @::@ 'Maybe' 'Text'
--
runInstances :: Text -- ^ 'riImageId'
             -> Int -- ^ 'riMinCount'
             -> Int -- ^ 'riMaxCount'
             -> RunInstances
runInstances p1 p2 p3 = RunInstances
    { _riImageId                           = p1
    , _riMinCount                          = p2
    , _riMaxCount                          = p3
    , _riDryRun                            = Nothing
    , _riKeyName                           = Nothing
    , _riSecurityGroups                    = mempty
    , _riSecurityGroupIds                  = mempty
    , _riUserData                          = Nothing
    , _riInstanceType                      = Nothing
    , _riPlacement                         = Nothing
    , _riKernelId                          = Nothing
    , _riRamdiskId                         = Nothing
    , _riBlockDeviceMappings               = mempty
    , _riMonitoring                        = Nothing
    , _riSubnetId                          = Nothing
    , _riDisableApiTermination             = Nothing
    , _riInstanceInitiatedShutdownBehavior = Nothing
    , _riPrivateIpAddress                  = Nothing
    , _riClientToken                       = Nothing
    , _riAdditionalInfo                    = Nothing
    , _riNetworkInterfaces                 = mempty
    , _riIamInstanceProfile                = Nothing
    , _riEbsOptimized                      = Nothing
    }

-- | Reserved.
riAdditionalInfo :: Lens' RunInstances (Maybe Text)
riAdditionalInfo = lens _riAdditionalInfo (\s a -> s { _riAdditionalInfo = a })

-- | The block device mapping.
riBlockDeviceMappings :: Lens' RunInstances [BlockDeviceMapping]
riBlockDeviceMappings =
    lens _riBlockDeviceMappings (\s a -> s { _riBlockDeviceMappings = a })

-- | Unique, case-sensitive identifier you provide to ensure the idempotency
-- of the request. For more information, see How to Ensure Idempotency in
-- the Amazon Elastic Compute Cloud User Guide. Constraints: Maximum 64
-- ASCII characters.
riClientToken :: Lens' RunInstances (Maybe Text)
riClientToken = lens _riClientToken (\s a -> s { _riClientToken = a })

-- | If you set this parameter to true, you can't terminate the instance using
-- the Amazon EC2 console, CLI, or API; otherwise, you can. If you set this
-- parameter to true and then later want to be able to terminate the
-- instance, you must first change the value of the disableApiTermination
-- attribute to false using ModifyInstanceAttribute. Alternatively, if you
-- set InstanceInitiatedShutdownBehavior to terminate, you can terminate the
-- instance by running the shutdown command from the instance. Default:
-- false.
riDisableApiTermination :: Lens' RunInstances (Maybe Bool)
riDisableApiTermination =
    lens _riDisableApiTermination (\s a -> s { _riDisableApiTermination = a })

riDryRun :: Lens' RunInstances (Maybe Bool)
riDryRun = lens _riDryRun (\s a -> s { _riDryRun = a })

-- | Indicates whether the instance is optimized for EBS I/O. This
-- optimization provides dedicated throughput to Amazon EBS and an optimized
-- configuration stack to provide optimal Amazon EBS I/O performance. This
-- optimization isn't available with all instance types. Additional usage
-- charges apply when using an EBS-optimized instance. Default: false.
riEbsOptimized :: Lens' RunInstances (Maybe Bool)
riEbsOptimized = lens _riEbsOptimized (\s a -> s { _riEbsOptimized = a })

-- | The IAM instance profile.
riIamInstanceProfile :: Lens' RunInstances (Maybe IamInstanceProfileSpecification)
riIamInstanceProfile =
    lens _riIamInstanceProfile (\s a -> s { _riIamInstanceProfile = a })

-- | The ID of the AMI, which you can get by calling DescribeImages.
riImageId :: Lens' RunInstances Text
riImageId = lens _riImageId (\s a -> s { _riImageId = a })

-- | Indicates whether an instance stops or terminates when you initiate
-- shutdown from the instance (using the operating system command for system
-- shutdown). Default: stop.
riInstanceInitiatedShutdownBehavior :: Lens' RunInstances (Maybe Text)
riInstanceInitiatedShutdownBehavior =
    lens _riInstanceInitiatedShutdownBehavior
        (\s a -> s { _riInstanceInitiatedShutdownBehavior = a })

-- | The instance type. For more information, see Instance Types in the Amazon
-- Elastic Compute Cloud User Guide. Default: m1.small.
riInstanceType :: Lens' RunInstances (Maybe Text)
riInstanceType = lens _riInstanceType (\s a -> s { _riInstanceType = a })

-- | The ID of the kernel. We recommend that you use PV-GRUB instead of
-- kernels and RAM disks. For more information, see PV-GRUB in the Amazon
-- Elastic Compute Cloud User Guide.
riKernelId :: Lens' RunInstances (Maybe Text)
riKernelId = lens _riKernelId (\s a -> s { _riKernelId = a })

-- | The name of the key pair. You can create a key pair using CreateKeyPair
-- or ImportKeyPair. If you launch an instance without specifying a key
-- pair, you can't connect to the instance.
riKeyName :: Lens' RunInstances (Maybe Text)
riKeyName = lens _riKeyName (\s a -> s { _riKeyName = a })

-- | The maximum number of instances to launch. If you specify more instances
-- than Amazon EC2 can launch in the target Availability Zone, Amazon EC2
-- launches the largest possible number of instances above MinCount.
-- Constraints: Between 1 and the maximum number you're allowed for the
-- specified instance type. For more information about the default limits,
-- and how to request an increase, see How many instances can I run in
-- Amazon EC2 in the Amazon EC2 General FAQ.
riMaxCount :: Lens' RunInstances Int
riMaxCount = lens _riMaxCount (\s a -> s { _riMaxCount = a })

-- | The minimum number of instances to launch. If you specify a minimum that
-- is more instances than Amazon EC2 can launch in the target Availability
-- Zone, Amazon EC2 launches no instances. Constraints: Between 1 and the
-- maximum number you're allowed for the specified instance type. For more
-- information about the default limits, and how to request an increase, see
-- How many instances can I run in Amazon EC2 in the Amazon EC2 General FAQ.
riMinCount :: Lens' RunInstances Int
riMinCount = lens _riMinCount (\s a -> s { _riMinCount = a })

-- | The monitoring for the instance.
riMonitoring :: Lens' RunInstances (Maybe RunInstancesMonitoringEnabled)
riMonitoring = lens _riMonitoring (\s a -> s { _riMonitoring = a })

-- | One or more network interfaces.
riNetworkInterfaces :: Lens' RunInstances [InstanceNetworkInterfaceSpecification]
riNetworkInterfaces =
    lens _riNetworkInterfaces (\s a -> s { _riNetworkInterfaces = a })

-- | The placement for the instance.
riPlacement :: Lens' RunInstances (Maybe Placement)
riPlacement = lens _riPlacement (\s a -> s { _riPlacement = a })

-- | [EC2-VPC] The primary IP address. You must specify a value from the IP
-- address range of the subnet. Only one private IP address can be
-- designated as primary. Therefore, you can't specify this parameter if
-- PrivateIpAddresses.n.Primary is set to true and
-- PrivateIpAddresses.n.PrivateIpAddress is set to an IP address. Default:
-- We select an IP address from the IP address range of the subnet.
riPrivateIpAddress :: Lens' RunInstances (Maybe Text)
riPrivateIpAddress =
    lens _riPrivateIpAddress (\s a -> s { _riPrivateIpAddress = a })

-- | The ID of the RAM disk. We recommend that you use PV-GRUB instead of
-- kernels and RAM disks. For more information, see PV-GRUB in the Amazon
-- Elastic Compute Cloud User Guide.
riRamdiskId :: Lens' RunInstances (Maybe Text)
riRamdiskId = lens _riRamdiskId (\s a -> s { _riRamdiskId = a })

-- | One or more security group IDs. You can create a security group using
-- CreateSecurityGroup. Default: Amazon EC2 uses the default security group.
riSecurityGroupIds :: Lens' RunInstances [Text]
riSecurityGroupIds =
    lens _riSecurityGroupIds (\s a -> s { _riSecurityGroupIds = a })

-- | [EC2-Classic, default VPC] One or more security group names. For a
-- nondefault VPC, you must use security group IDs instead. Default: Amazon
-- EC2 uses the default security group.
riSecurityGroups :: Lens' RunInstances [Text]
riSecurityGroups = lens _riSecurityGroups (\s a -> s { _riSecurityGroups = a })

-- | [EC2-VPC] The ID of the subnet to launch the instance into.
riSubnetId :: Lens' RunInstances (Maybe Text)
riSubnetId = lens _riSubnetId (\s a -> s { _riSubnetId = a })

-- | The Base64-encoded MIME user data for the instances.
riUserData :: Lens' RunInstances (Maybe Text)
riUserData = lens _riUserData (\s a -> s { _riUserData = a })

data RunInstancesResponse = RunInstancesResponse
    { _rirGroups        :: [GroupIdentifier]
    , _rirInstances     :: [Instance]
    , _rirOwnerId       :: Maybe Text
    , _rirRequesterId   :: Maybe Text
    , _rirReservationId :: Maybe Text
    } deriving (Eq, Show, Generic)

-- | 'RunInstancesResponse' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rirGroups' @::@ ['GroupIdentifier']
--
-- * 'rirInstances' @::@ ['Instance']
--
-- * 'rirOwnerId' @::@ 'Maybe' 'Text'
--
-- * 'rirRequesterId' @::@ 'Maybe' 'Text'
--
-- * 'rirReservationId' @::@ 'Maybe' 'Text'
--
runInstancesResponse :: RunInstancesResponse
runInstancesResponse = RunInstancesResponse
    { _rirReservationId = Nothing
    , _rirOwnerId       = Nothing
    , _rirRequesterId   = Nothing
    , _rirGroups        = mempty
    , _rirInstances     = mempty
    }

-- | One or more security groups.
rirGroups :: Lens' RunInstancesResponse [GroupIdentifier]
rirGroups = lens _rirGroups (\s a -> s { _rirGroups = a })

-- | One or more instances.
rirInstances :: Lens' RunInstancesResponse [Instance]
rirInstances = lens _rirInstances (\s a -> s { _rirInstances = a })

-- | The ID of the AWS account that owns the reservation.
rirOwnerId :: Lens' RunInstancesResponse (Maybe Text)
rirOwnerId = lens _rirOwnerId (\s a -> s { _rirOwnerId = a })

-- | The ID of the requester that launched the instances on your behalf (for
-- example, AWS Management Console or Auto Scaling).
rirRequesterId :: Lens' RunInstancesResponse (Maybe Text)
rirRequesterId = lens _rirRequesterId (\s a -> s { _rirRequesterId = a })

-- | The ID of the reservation.
rirReservationId :: Lens' RunInstancesResponse (Maybe Text)
rirReservationId = lens _rirReservationId (\s a -> s { _rirReservationId = a })

instance AWSRequest RunInstances where
    type Sv RunInstances = EC2
    type Rs RunInstances = RunInstancesResponse

    request  = post "RunInstances"
    response = xmlResponse

instance FromXML RunInstancesResponse where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "RunInstancesResponse"

instance ToPath RunInstances where
    toPath = const "/"

instance ToHeaders RunInstances

instance ToQuery RunInstances
