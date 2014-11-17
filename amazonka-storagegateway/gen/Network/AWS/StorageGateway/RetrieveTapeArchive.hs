{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.StorageGateway.RetrieveTapeArchive
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Retrieves an archived virtual tape from the virtual tape shelf (VTS) to a
-- gateway-VTL. Virtual tapes archived in the VTS are not associated with any
-- gateway. However after a tape is retrieved, it is associated with a
-- gateway, even though it is also listed in the VTS. Once a tape is
-- successfully retrieved to a gateway, it cannot be retrieved again to
-- another gateway. You must archive the tape again before you can retrieve it
-- to another gateway.
--
-- <RetrieveTapeArchive.html>
module Network.AWS.StorageGateway.RetrieveTapeArchive
    (
    -- * Request
      RetrieveTapeArchive
    -- ** Request constructor
    , retrieveTapeArchive
    -- ** Request lenses
    , rtaGatewayARN
    , rtaTapeARN

    -- * Response
    , RetrieveTapeArchiveResponse
    -- ** Response constructor
    , retrieveTapeArchiveResponse
    -- ** Response lenses
    , rtarTapeARN
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.JSON
import Network.AWS.StorageGateway.Types
import qualified GHC.Exts

data RetrieveTapeArchive = RetrieveTapeArchive
    { _rtaGatewayARN :: Text
    , _rtaTapeARN    :: Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'RetrieveTapeArchive' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rtaGatewayARN' @::@ 'Text'
--
-- * 'rtaTapeARN' @::@ 'Text'
--
retrieveTapeArchive :: Text -- ^ 'rtaTapeARN'
                    -> Text -- ^ 'rtaGatewayARN'
                    -> RetrieveTapeArchive
retrieveTapeArchive p1 p2 = RetrieveTapeArchive
    { _rtaTapeARN    = p1
    , _rtaGatewayARN = p2
    }

-- | The Amazon Resource Name (ARN) of the gateway you want to retrieve the
-- virtual tape to. Use the ListGateways operation to return a list of
-- gateways for your account and region. You retrieve archived virtual tapes
-- to only one gateway and the gateway must be a gateway-VTL.
rtaGatewayARN :: Lens' RetrieveTapeArchive Text
rtaGatewayARN = lens _rtaGatewayARN (\s a -> s { _rtaGatewayARN = a })

-- | The Amazon Resource Name (ARN) of the virtual tape you want to retrieve
-- from the virtual tape shelf (VTS).
rtaTapeARN :: Lens' RetrieveTapeArchive Text
rtaTapeARN = lens _rtaTapeARN (\s a -> s { _rtaTapeARN = a })

newtype RetrieveTapeArchiveResponse = RetrieveTapeArchiveResponse
    { _rtarTapeARN :: Maybe Text
    } deriving (Eq, Ord, Show, Generic, Monoid)

-- | 'RetrieveTapeArchiveResponse' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rtarTapeARN' @::@ 'Maybe' 'Text'
--
retrieveTapeArchiveResponse :: RetrieveTapeArchiveResponse
retrieveTapeArchiveResponse = RetrieveTapeArchiveResponse
    { _rtarTapeARN = Nothing
    }

-- | The Amazon Resource Name (ARN) of the retrieved virtual tape.
rtarTapeARN :: Lens' RetrieveTapeArchiveResponse (Maybe Text)
rtarTapeARN = lens _rtarTapeARN (\s a -> s { _rtarTapeARN = a })

instance AWSRequest RetrieveTapeArchive where
    type Sv RetrieveTapeArchive = StorageGateway
    type Rs RetrieveTapeArchive = RetrieveTapeArchiveResponse

    request  = post
    response = jsonResponse

instance FromJSON RetrieveTapeArchiveResponse where
    parseJSON = genericParseJSON jsonOptions

instance ToPath RetrieveTapeArchive where
    toPath = const "/"

instance ToHeaders RetrieveTapeArchive

instance ToQuery RetrieveTapeArchive where
    toQuery = const mempty

instance ToJSON RetrieveTapeArchive where
    toJSON = genericToJSON jsonOptions
