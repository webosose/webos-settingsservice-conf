# Copyright (c) 2016-2022 LG Electronics, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 2.8.7)

project(SettingsServiceConf)

include(webOS/webOS)
webos_modules_init(1 5 0)
webos_component(1 0 0)

file(GLOB_RECURSE LOCALE_FILES files/default-settings/locale*.json)
file(GLOB_RECURSE COUNTRY_FILES files/default-settings/country*.json)

execute_process(COMMAND ${PROJECT_SOURCE_DIR}/files/scripts/generates_ex.sh)

set(DEFAULT_SETTINGS_FILES
    files/default-settings/defaultSettings.json
    files/default-settings/description.json
    files/default-settings/description.bson
    files/default-settings/dimensionFormat.json
    files/default-settings/languageStyle.json
    files/default-settings/defaultTimeZone.json
    files/default-settings/description.map.json
    files/default-settings/description.map.bson
    files/default-settings/description.categorykeysmap.bson
    files/default-settings/description.categorykeysmap.json
    files/default-settings/settingsservice.conf
    )

set(SETTINGS_FILES
     files/settings/prefsFileWriterRule.json
     files/settings/fileCacheSchema.json
     )

install(FILES ${LOCALE_FILES} DESTINATION ${WEBOS_INSTALL_WEBOS_SYSCONFDIR})
install(FILES ${COUNTRY_FILES} DESTINATION ${WEBOS_INSTALL_WEBOS_SYSCONFDIR})
install(FILES ${DEFAULT_SETTINGS_FILES} DESTINATION ${WEBOS_INSTALL_WEBOS_SYSCONFDIR})
install(FILES ${SETTINGS_FILES} DESTINATION ${WEBOS_INSTALL_WEBOS_SYSCONFDIR}/settings)
