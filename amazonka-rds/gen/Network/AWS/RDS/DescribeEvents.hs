{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.RDS.DescribeEvents
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns events related to DB instances, DB security groups, DB snapshots,
-- and DB parameter groups for the past 14 days. Events specific to a
-- particular DB instance, DB security group, database snapshot, or DB
-- parameter group can be obtained by providing the name as a parameter. By
-- default, the past hour of events are returned.
--
-- <DescribeEvents.html>
module Network.AWS.RDS.DescribeEvents
    (
    -- * Request
      DescribeEvents
    -- ** Request constructor
    , describeEvents
    -- ** Request lenses
    , deDuration
    , deEndTime
    , deEventCategories
    , deFilters
    , deMarker
    , deMaxRecords
    , deSourceIdentifier
    , deSourceType
    , deStartTime

    -- * Response
    , DescribeEventsResponse
    -- ** Response constructor
    , describeEventsResponse
    -- ** Response lenses
    , derEvents
    , derMarker
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.RDS.Types
import qualified GHC.Exts

data DescribeEvents = DescribeEvents
    { _deDuration         :: Maybe Int
    , _deEndTime          :: Maybe RFC822
    , _deEventCategories  :: [Text]
    , _deFilters          :: [Filter]
    , _deMarker           :: Maybe Text
    , _deMaxRecords       :: Maybe Int
    , _deSourceIdentifier :: Maybe Text
    , _deSourceType       :: Maybe Text
    , _deStartTime        :: Maybe RFC822
    } deriving (Eq, Show, Generic)

-- | 'DescribeEvents' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'deDuration' @::@ 'Maybe' 'Int'
--
-- * 'deEndTime' @::@ 'Maybe' 'UTCTime'
--
-- * 'deEventCategories' @::@ ['Text']
--
-- * 'deFilters' @::@ ['Filter']
--
-- * 'deMarker' @::@ 'Maybe' 'Text'
--
-- * 'deMaxRecords' @::@ 'Maybe' 'Int'
--
-- * 'deSourceIdentifier' @::@ 'Maybe' 'Text'
--
-- * 'deSourceType' @::@ 'Maybe' 'Text'
--
-- * 'deStartTime' @::@ 'Maybe' 'UTCTime'
--
describeEvents :: DescribeEvents
describeEvents = DescribeEvents
    { _deSourceIdentifier = Nothing
    , _deSourceType       = Nothing
    , _deStartTime        = Nothing
    , _deEndTime          = Nothing
    , _deDuration         = Nothing
    , _deEventCategories  = mempty
    , _deFilters          = mempty
    , _deMaxRecords       = Nothing
    , _deMarker           = Nothing
    }

-- | The number of minutes to retrieve events for. Default: 60.
deDuration :: Lens' DescribeEvents (Maybe Int)
deDuration = lens _deDuration (\s a -> s { _deDuration = a })

-- | The end of the time interval for which to retrieve events, specified in
-- ISO 8601 format. For more information about ISO 8601, go to the ISO8601
-- Wikipedia page. Example: 2009-07-08T18:00Z.
deEndTime :: Lens' DescribeEvents (Maybe UTCTime)
deEndTime = lens _deEndTime (\s a -> s { _deEndTime = a })
    . mapping _Time

-- | A list of event categories that trigger notifications for a event
-- notification subscription.
deEventCategories :: Lens' DescribeEvents [Text]
deEventCategories =
    lens _deEventCategories (\s a -> s { _deEventCategories = a })

-- | This parameter is not currently supported.
deFilters :: Lens' DescribeEvents [Filter]
deFilters = lens _deFilters (\s a -> s { _deFilters = a })

-- | An optional pagination token provided by a previous DescribeEvents
-- request. If this parameter is specified, the response includes only
-- records beyond the marker, up to the value specified by MaxRecords.
deMarker :: Lens' DescribeEvents (Maybe Text)
deMarker = lens _deMarker (\s a -> s { _deMarker = a })

-- | The maximum number of records to include in the response. If more records
-- exist than the specified MaxRecords value, a pagination token called a
-- marker is included in the response so that the remaining results may be
-- retrieved. Default: 100 Constraints: minimum 20, maximum 100.
deMaxRecords :: Lens' DescribeEvents (Maybe Int)
deMaxRecords = lens _deMaxRecords (\s a -> s { _deMaxRecords = a })

-- | The identifier of the event source for which events will be returned. If
-- not specified, then all sources are included in the response.
-- Constraints: If SourceIdentifier is supplied, SourceType must also be
-- provided. If the source type is DBInstance, then a DBInstanceIdentifier
-- must be supplied. If the source type is DBSecurityGroup, a
-- DBSecurityGroupName must be supplied. If the source type is
-- DBParameterGroup, a DBParameterGroupName must be supplied. If the source
-- type is DBSnapshot, a DBSnapshotIdentifier must be supplied. Cannot end
-- with a hyphen or contain two consecutive hyphens.
deSourceIdentifier :: Lens' DescribeEvents (Maybe Text)
deSourceIdentifier =
    lens _deSourceIdentifier (\s a -> s { _deSourceIdentifier = a })

-- | The event source to retrieve events for. If no value is specified, all
-- events are returned.
deSourceType :: Lens' DescribeEvents (Maybe Text)
deSourceType = lens _deSourceType (\s a -> s { _deSourceType = a })

-- | The beginning of the time interval to retrieve events for, specified in
-- ISO 8601 format. For more information about ISO 8601, go to the ISO8601
-- Wikipedia page. Example: 2009-07-08T18:00Z.
deStartTime :: Lens' DescribeEvents (Maybe UTCTime)
deStartTime = lens _deStartTime (\s a -> s { _deStartTime = a })
    . mapping _Time

data DescribeEventsResponse = DescribeEventsResponse
    { _derEvents :: [Event]
    , _derMarker :: Maybe Text
    } deriving (Eq, Show, Generic)

-- | 'DescribeEventsResponse' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'derEvents' @::@ ['Event']
--
-- * 'derMarker' @::@ 'Maybe' 'Text'
--
describeEventsResponse :: DescribeEventsResponse
describeEventsResponse = DescribeEventsResponse
    { _derMarker = Nothing
    , _derEvents = mempty
    }

-- | A list of Event instances.
derEvents :: Lens' DescribeEventsResponse [Event]
derEvents = lens _derEvents (\s a -> s { _derEvents = a })

-- | An optional pagination token provided by a previous Events request. If
-- this parameter is specified, the response includes only records beyond
-- the marker, up to the value specified by MaxRecords .
derMarker :: Lens' DescribeEventsResponse (Maybe Text)
derMarker = lens _derMarker (\s a -> s { _derMarker = a })

instance AWSRequest DescribeEvents where
    type Sv DescribeEvents = RDS
    type Rs DescribeEvents = DescribeEventsResponse

    request  = post "DescribeEvents"
    response = xmlResponse

instance FromXML DescribeEventsResponse where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "DescribeEventsResponse"

instance ToPath DescribeEvents where
    toPath = const "/"

instance ToHeaders DescribeEvents

instance ToQuery DescribeEvents
