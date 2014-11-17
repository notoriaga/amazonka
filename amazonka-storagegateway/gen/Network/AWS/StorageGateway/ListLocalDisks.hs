{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.StorageGateway.ListLocalDisks
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This operation returns a list of the local disks of a gateway. To specify
-- which gateway to describe you use the Amazon Resource Name (ARN) of the
-- gateway in the body of the request. The request returns all disks,
-- specifying which are configured as working storage, stored volume or not
-- configured at all.
--
-- <ListLocalDisks.html>
module Network.AWS.StorageGateway.ListLocalDisks
    (
    -- * Request
      ListLocalDisks
    -- ** Request constructor
    , listLocalDisks
    -- ** Request lenses
    , lldGatewayARN

    -- * Response
    , ListLocalDisksResponse
    -- ** Response constructor
    , listLocalDisksResponse
    -- ** Response lenses
    , lldrDisks
    , lldrGatewayARN
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.JSON
import Network.AWS.StorageGateway.Types
import qualified GHC.Exts

newtype ListLocalDisks = ListLocalDisks
    { _lldGatewayARN :: Text
    } deriving (Eq, Ord, Show, Generic, Monoid, IsString)

-- | 'ListLocalDisks' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lldGatewayARN' @::@ 'Text'
--
listLocalDisks :: Text -- ^ 'lldGatewayARN'
               -> ListLocalDisks
listLocalDisks p1 = ListLocalDisks
    { _lldGatewayARN = p1
    }

lldGatewayARN :: Lens' ListLocalDisks Text
lldGatewayARN = lens _lldGatewayARN (\s a -> s { _lldGatewayARN = a })

data ListLocalDisksResponse = ListLocalDisksResponse
    { _lldrDisks      :: [Disk]
    , _lldrGatewayARN :: Maybe Text
    } deriving (Eq, Show, Generic)

-- | 'ListLocalDisksResponse' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lldrDisks' @::@ ['Disk']
--
-- * 'lldrGatewayARN' @::@ 'Maybe' 'Text'
--
listLocalDisksResponse :: ListLocalDisksResponse
listLocalDisksResponse = ListLocalDisksResponse
    { _lldrGatewayARN = Nothing
    , _lldrDisks      = mempty
    }

lldrDisks :: Lens' ListLocalDisksResponse [Disk]
lldrDisks = lens _lldrDisks (\s a -> s { _lldrDisks = a })

lldrGatewayARN :: Lens' ListLocalDisksResponse (Maybe Text)
lldrGatewayARN = lens _lldrGatewayARN (\s a -> s { _lldrGatewayARN = a })

instance AWSRequest ListLocalDisks where
    type Sv ListLocalDisks = StorageGateway
    type Rs ListLocalDisks = ListLocalDisksResponse

    request  = post
    response = jsonResponse

instance FromJSON ListLocalDisksResponse where
    parseJSON = genericParseJSON jsonOptions

instance ToPath ListLocalDisks where
    toPath = const "/"

instance ToHeaders ListLocalDisks

instance ToQuery ListLocalDisks where
    toQuery = const mempty

instance ToJSON ListLocalDisks where
    toJSON = genericToJSON jsonOptions
