{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudFront.ListInvalidations
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | List invalidation batches.
--
-- <ListInvalidations.html>
module Network.AWS.CloudFront.ListInvalidations
    (
    -- * Request
      ListInvalidations
    -- ** Request constructor
    , listInvalidations
    -- ** Request lenses
    , liDistributionId
    , liMarker
    , liMaxItems

    -- * Response
    , ListInvalidationsResponse
    -- ** Response constructor
    , listInvalidationsResponse
    -- ** Response lenses
    , lirInvalidationList
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.XML
import Network.AWS.CloudFront.Types
import qualified GHC.Exts

data ListInvalidations = ListInvalidations
    { _liDistributionId :: Text
    , _liMarker         :: Maybe Text
    , _liMaxItems       :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'ListInvalidations' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'liDistributionId' @::@ 'Text'
--
-- * 'liMarker' @::@ 'Maybe' 'Text'
--
-- * 'liMaxItems' @::@ 'Maybe' 'Text'
--
listInvalidations :: Text -- ^ 'liDistributionId'
                  -> ListInvalidations
listInvalidations p1 = ListInvalidations
    { _liDistributionId = p1
    , _liMarker         = Nothing
    , _liMaxItems       = Nothing
    }

-- | The distribution's id.
liDistributionId :: Lens' ListInvalidations Text
liDistributionId = lens _liDistributionId (\s a -> s { _liDistributionId = a })

-- | Use this parameter when paginating results to indicate where to begin in
-- your list of invalidation batches. Because the results are returned in
-- decreasing order from most recent to oldest, the most recent results are
-- on the first page, the second page will contain earlier results, and so
-- on. To get the next page of results, set the Marker to the value of the
-- NextMarker from the current page's response. This value is the same as
-- the ID of the last invalidation batch on that page.
liMarker :: Lens' ListInvalidations (Maybe Text)
liMarker = lens _liMarker (\s a -> s { _liMarker = a })

-- | The maximum number of invalidation batches you want in the response body.
liMaxItems :: Lens' ListInvalidations (Maybe Text)
liMaxItems = lens _liMaxItems (\s a -> s { _liMaxItems = a })

newtype ListInvalidationsResponse = ListInvalidationsResponse
    { _lirInvalidationList :: Maybe InvalidationList
    } deriving (Eq, Show, Generic)

-- | 'ListInvalidationsResponse' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lirInvalidationList' @::@ 'Maybe' 'InvalidationList'
--
listInvalidationsResponse :: ListInvalidationsResponse
listInvalidationsResponse = ListInvalidationsResponse
    { _lirInvalidationList = Nothing
    }

-- | Information about invalidation batches.
lirInvalidationList :: Lens' ListInvalidationsResponse (Maybe InvalidationList)
lirInvalidationList =
    lens _lirInvalidationList (\s a -> s { _lirInvalidationList = a })

instance AWSRequest ListInvalidations where
    type Sv ListInvalidations = CloudFront
    type Rs ListInvalidations = ListInvalidationsResponse

    request  = get
    response = xmlResponse

instance FromXML ListInvalidationsResponse where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ListInvalidationsResponse"

instance ToPath ListInvalidations where
    toPath ListInvalidations{..} = mconcat
        [ "/2014-05-31/distribution/"
        , toText _liDistributionId
        , "/invalidation"
        ]

instance ToHeaders ListInvalidations

instance ToQuery ListInvalidations where
    toQuery ListInvalidations{..} = mconcat
        [ "Marker"   =? _liMarker
        , "MaxItems" =? _liMaxItems
        ]

instance ToXML ListInvalidations where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "ListInvalidations"
