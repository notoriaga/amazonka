{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CodeDeploy.DeleteApplication
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes an application.
--
-- <DeleteApplication.html>
module Network.AWS.CodeDeploy.DeleteApplication
    (
    -- * Request
      DeleteApplication
    -- ** Request constructor
    , deleteApplication
    -- ** Request lenses
    , daApplicationName

    -- * Response
    , DeleteApplicationResponse
    -- ** Response constructor
    , deleteApplicationResponse
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.JSON
import Network.AWS.CodeDeploy.Types
import qualified GHC.Exts

newtype DeleteApplication = DeleteApplication
    { _daApplicationName :: Text
    } deriving (Eq, Ord, Show, Generic, Monoid, IsString)

-- | 'DeleteApplication' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'daApplicationName' @::@ 'Text'
--
deleteApplication :: Text -- ^ 'daApplicationName'
                  -> DeleteApplication
deleteApplication p1 = DeleteApplication
    { _daApplicationName = p1
    }

-- | The name of an existing AWS CodeDeploy application within the AWS user
-- account.
daApplicationName :: Lens' DeleteApplication Text
daApplicationName =
    lens _daApplicationName (\s a -> s { _daApplicationName = a })

data DeleteApplicationResponse = DeleteApplicationResponse
    deriving (Eq, Ord, Show, Generic)

-- | 'DeleteApplicationResponse' constructor.
deleteApplicationResponse :: DeleteApplicationResponse
deleteApplicationResponse = DeleteApplicationResponse

instance AWSRequest DeleteApplication where
    type Sv DeleteApplication = CodeDeploy
    type Rs DeleteApplication = DeleteApplicationResponse

    request  = post
    response = nullResponse DeleteApplicationResponse

instance ToPath DeleteApplication where
    toPath = const "/"

instance ToHeaders DeleteApplication

instance ToQuery DeleteApplication where
    toQuery = const mempty

instance ToJSON DeleteApplication where
    toJSON = genericToJSON jsonOptions
