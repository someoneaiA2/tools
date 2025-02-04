#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with LZip Shell Exec <https://github.com/FajarKim/lzip-shell>
# The filename 'toolsw.sh' encrypted at Sat Jul  6 13:48:24 +07 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, lzipsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=76
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

lztmpdir=
trap 'res=$?
  test -n "$lztmpdir" && rm -fr "$lztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  lztmpdir=`mktemp -d "${TMPDIR}lztmpXXXXXXXXX"`
else
  lztmpdir=${TMPDIR}lztmp$$; mkdir $lztmpdir
fi || { (exit 127); exit 127; }

lztmp=$lztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$lztmp" && rm -r "$lztmp";;
*/*) lztmp=$lztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | lzip -cd > "$lztmp"; then
  umask $umask
  chmod 700 "$lztmp"
  (sleep 5; rm -fr "$lztmpdir") 2>/dev/null &
  "$lztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
LZIPM �BF=�j�g�z�p
 ͞\�a��p����ޢ�� �,��t���w\%"�����~9 �c͒?u��×��ǉ��Z ���b1e�0�ɭ9h��nU �d�����VK�Xܟ ��<�)IK�G��G/���4�ۏ�2�g���j��+sů�u^��Z{�ō�d9_�i���=F����3	�~x_��,��C�z�2~2�݋�!�z��z�)*���n�n�����9(t�åGeDu�!k�#R��d ��/�+�4q��ո~&j�c��G�d�O+�Y$))t��Z��]݁����u�5�N+#C��?��Y.�V�\;���o�����Ӈ"�Bl#���=���K���(z�	�<�I�P�~,��H/٤�{Ss�h~�$��v�d����/ܚR?D=|����KZ�������7G~�nQ�O�o���/w���]W�����)�UK���w�ӛ�*��ޑ��G�_����B�����d�ͩ	o˪�EiTA�,X�k����"���r�+����M6�R'n���d�p8�2*z�ݭ�h�C�s_�#���'�2�(8���]s�����hh�U7��GIJ<N��I�]{CP��X��%m;}�O�L����ݷy�W�b��W����Zư1���=�W��)�d�i��:F���t^�c�1�[і�<�O4�	������T�r\��/������D�iXC8�3 �m�H����#:��f�i���G��xh:���ӓ�5W��ׅ2��=g\X%	Ejs�t����\�V}�m�Z��S�RH�BD���2H�8P�Q0�0)t�1h��a[+��`4�����u���5ӽ6�$S�{��d (�"�����j}\׵���__�v����p"	Jġa/g8Еon��d���|��{���vJ��, ���;Kj���V����F��"��	�>ˌ��e�/,���>߷F}f������ݰ E1(��D���'�͡}i��V���b��8�{W�a�A �F��&���u��D�V~�z�$�N��ߜ��l�le�m���ѳ�˟�U����W:��t�Hv���F*;��(�q����3 �c\�kt	��p�s��A���g����:�_7&7.4e���+s���s�P�s4���G���3l6-�Э��|�E�z�"ӏ�]�nK��M��醳�	�� �`ϼ����<���$�D�o���.~��x�8��I�t�L��"�v�r�+Q�b����26C;��!f=�X�C�L,~�V��Vg��&��R�AE�o���r���m ��x@�E\�3vfY��=�Ĝ�XXR���Su�E��-�S��g��O.+D��������ΏL��`���;˵<Q���$[�b g+�o�H4�"O�@Q���Yo1�q�L% �A�{����
!����"E.LbU�m�b��W
/��"1B��g��A��7:)��3���,�RJ-��e۶(�ga}�Re�t*�,3w~�gl���0%$ږ7�,���a�����V��r/mԙ�E�[ r�c�9�)����?b���>%l@8�����ׄ=���FH�\�v"�؁��u�Qߥ�q#��J떩�7�7t� VvX/\�E2��=gn[�Y�S TrĢ��%�~eCxT�ص'�t4��If>G]T
e���t��2 Q�xvig �!�������b:�B�`����4��|�{�i)Ƞ_f�#q��$/9aL���"��}[�Cv,gf�\)�˺kC�/�cq{YX�����������4��=�엳�W���Ύ�	g��$n$c�N��[���g� �Zz��e���ޭ���'�ݦ6e�-�٤Ce� -|�E��&�C�R_�`sZ�!+Ⴕg�k��`c��M�撜Y�%B�6�ހ�����Ћ�]m���@���Ol�i@� �	�${F�ҐA[1��|�2x5�1(�`����
��|�)O?�!Aޟ��{Ah��Y�3As���"�OG[{���P{���zy^��Թ`g���7�m��EYR��dV�L�Q�ż�9���Et�1�s��D;���Jk	��(��U�u�8��^^o�K��P��rO^��=�����@%�6����E.�U?cF�.!�@�uHH^ʞ��.����T��A�$�Av@ �Z��ȏ(	�QAġ����vfcv,;�ىb�2�Aƶ����>�|R"���{���7�?jz�{S͔�)k�*�rf����#'- L"��      �      