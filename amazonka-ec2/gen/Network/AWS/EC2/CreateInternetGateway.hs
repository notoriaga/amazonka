{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.CreateInternetGateway
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates an Internet gateway for use with a VPC. After creating the Internet
-- gateway, you attach it to a VPC using AttachInternetGateway. For more
-- information about your VPC and Internet gateway, see the Amazon Virtual
-- Private Cloud User Guide.
--
-- <CreateInternetGateway.html>
module Network.AWS.EC2.CreateInternetGateway
    (
    -- * Request
      CreateInternetGateway
    -- ** Request constructor
    , createInternetGateway
    -- ** Request lenses
    , cigDryRun

    -- * Response
    , CreateInternetGatewayResponse
    -- ** Response constructor
    , createInternetGatewayResponse
    -- ** Response lenses
    , cigrInternetGateway
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.EC2.Types
import qualified GHC.Exts

newtype CreateInternetGateway = CreateInternetGateway
    { _cigDryRun :: Maybe Bool
    } deriving (Eq, Ord, Show, Generic)

-- | 'CreateInternetGateway' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cigDryRun' @::@ 'Maybe' 'Bool'
--
createInternetGateway :: CreateInternetGateway
createInternetGateway = CreateInternetGateway
    { _cigDryRun = Nothing
    }

cigDryRun :: Lens' CreateInternetGateway (Maybe Bool)
cigDryRun = lens _cigDryRun (\s a -> s { _cigDryRun = a })

newtype CreateInternetGatewayResponse = CreateInternetGatewayResponse
    { _cigrInternetGateway :: Maybe InternetGateway
    } deriving (Eq, Show, Generic)

-- | 'CreateInternetGatewayResponse' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cigrInternetGateway' @::@ 'Maybe' 'InternetGateway'
--
createInternetGatewayResponse :: CreateInternetGatewayResponse
createInternetGatewayResponse = CreateInternetGatewayResponse
    { _cigrInternetGateway = Nothing
    }

-- | Information about the Internet gateway.
cigrInternetGateway :: Lens' CreateInternetGatewayResponse (Maybe InternetGateway)
cigrInternetGateway =
    lens _cigrInternetGateway (\s a -> s { _cigrInternetGateway = a })

instance AWSRequest CreateInternetGateway where
    type Sv CreateInternetGateway = EC2
    type Rs CreateInternetGateway = CreateInternetGatewayResponse

    request  = post "CreateInternetGateway"
    response = xmlResponse

instance FromXML CreateInternetGatewayResponse where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "CreateInternetGatewayResponse"

instance ToPath CreateInternetGateway where
    toPath = const "/"

instance ToHeaders CreateInternetGateway

instance ToQuery CreateInternetGateway
