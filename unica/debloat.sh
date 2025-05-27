#
# Copyright (C) 2023 Salvo Giangreco
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# UN1CA debloat list
# - Add entries inside the specific partition containing that file (<PARTITION>_DEBLOAT+="")
# - DO NOT add the partition name at the start of any entry (eg. "/system/dpolicy_system")
# - DO NOT add a slash at the start of any entry (eg. "/dpolicy_system")

# Samsung Defex policy
SYSTEM_DEBLOAT+="
dpolicy_system
"
VENDOR_DEBLOAT+="
etc/dpolicy
"

# Samsung SIM Unlock
SYSTEM_DEBLOAT+="
system/bin/ssud
system/etc/init/ssu_e2sxxx.rc
system/etc/init/ssu.rc
system/etc/permissions/privapp-permissions-com.samsung.ssu.xml
system/etc/sysconfig/samsungsimunlock.xml
system/lib64/android.security.securekeygeneration-ndk.so
system/lib64/vendor.samsung.hardware.security.ssu-V1-ndk.so
system/lib64/libssu_keystore2.so
system/priv-app/SsuService
"

# Recovery restoration script
VENDOR_DEBLOAT+="
recovery-from-boot.p
bin/install-recovery.sh
etc/init/vendor_flash_recovery.rc
"

# SEPolicy version
VENDOR_DEBLOAT+="
etc/selinux/vendor_sepolicy_version
"

PRISM_DEBLOAT+="
app
media
preload
priv-app
sipdb/Xt9
sipdb/SwiftKey/ar
sipdb/SwiftKey/as
sipdb/SwiftKey/az
sipdb/SwiftKey/be
sipdb/SwiftKey/bg
sipdb/SwiftKey/bn
sipdb/SwiftKey/cs
sipdb/SwiftKey/da
sipdb/SwiftKey/de
sipdb/SwiftKey/el
sipdb/SwiftKey/en_au
sipdb/SwiftKey/en_gb
sipdb/SwiftKey/en_in
sipdb/SwiftKey/es_es
sipdb/SwiftKey/es_us
sipdb/SwiftKey/et
sipdb/SwiftKey/fa
sipdb/SwiftKey/fi
sipdb/SwiftKey/fr_fr
sipdb/SwiftKey/gu
sipdb/SwiftKey/he
sipdb/SwiftKey/hi
sipdb/SwiftKey/hr
sipdb/SwiftKey/hu
sipdb/SwiftKey/hy
sipdb/SwiftKey/id
sipdb/SwiftKey/is
sipdb/SwiftKey/it
sipdb/SwiftKey/jv_id
sipdb/SwiftKey/ka
sipdb/SwiftKey/kk
sipdb/SwiftKey/km
sipdb/SwiftKey/kn
sipdb/SwiftKey/ko
sipdb/SwiftKey/ky
sipdb/SwiftKey/lo
sipdb/SwiftKey/lt
sipdb/SwiftKey/lv
sipdb/SwiftKey/mk
sipdb/SwiftKey/ml
sipdb/SwiftKey/mn
sipdb/SwiftKey/mr
sipdb/SwiftKey/ms
sipdb/SwiftKey/my_mm
sipdb/SwiftKey/my_zg
sipdb/SwiftKey/nb
sipdb/SwiftKey/ne
sipdb/SwiftKey/nl
sipdb/SwiftKey/or
sipdb/SwiftKey/pa
sipdb/SwiftKey/pl
sipdb/SwiftKey/pt_br
sipdb/SwiftKey/pt_pt
sipdb/SwiftKey/ro
sipdb/SwiftKey/ru
sipdb/SwiftKey/si
sipdb/SwiftKey/sk
sipdb/SwiftKey/sl
sipdb/SwiftKey/sq
sipdb/SwiftKey/sr
sipdb/SwiftKey/su_id
sipdb/SwiftKey/sv
sipdb/SwiftKey/szl
sipdb/SwiftKey/ta
sipdb/SwiftKey/te
sipdb/SwiftKey/tg
sipdb/SwiftKey/th
sipdb/SwiftKey/tk
sipdb/SwiftKey/tl
sipdb/SwiftKey/tr
sipdb/SwiftKey/uk
sipdb/SwiftKey/ur
sipdb/SwiftKey/uz
sipdb/SwiftKey/vi
HWRDB/data/hwr_zh_CN.dat
HWRDB/data/hwr_zh_HK.dat
HWRDB/data/hwr_zh_TW.dat
"

# eSIM
if $SOURCE_IS_ESIM_SUPPORTED; then
    if ! $TARGET_IS_ESIM_SUPPORTED; then
        SYSTEM_DEBLOAT+="
        system/etc/permissions/privapp-permissions-com.samsung.android.app.esimkeystring.xml
        system/etc/permissions/privapp-permissions-com.samsung.euicc.mep.xml
        system/etc/sysconfig/preinstalled-packages-com.samsung.android.app.esimkeystring.xml
        system/etc/sysconfig/preinstalled-packages-com.samsung.euicc.xml
        system/priv-app/EsimKeyString
        system/priv-app/EsimClient
        system/priv-app/EuiccService
        "
    fi
fi
