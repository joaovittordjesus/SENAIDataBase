PGDMP  5    2                |         
   locadoradb    16.2    16.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    27769 
   locadoradb    DATABASE     �   CREATE DATABASE locadoradb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE locadoradb;
                postgres    false                      0    27778    agencia 
   TABLE DATA           R   COPY public.agencia (numero_agencia, email, telefone, endereco, nome) FROM stdin;
    public          postgres    false    218                    0    27833    carro 
   TABLE DATA           }   COPY public.carro (id_carro, numero_agencia, placa, modelo, ano, tipo, disponibilidade, id_locacao, valor_total) FROM stdin;
    public          postgres    false    227   �                 0    27771    cliente 
   TABLE DATA           k   COPY public.cliente (id_cliente, email, celular, nome, sobrenome, cidade, estado, habilitacao) FROM stdin;
    public          postgres    false    216   �                 0    27785    comprovante 
   TABLE DATA           \   COPY public.comprovante (id_comprovante, comprovante, id_pagamento, id_cliente) FROM stdin;
    public          postgres    false    220   `                 0    27853    feedback 
   TABLE DATA           R   COPY public.feedback (id_feedback, comentario, avaliacao, id_cliente) FROM stdin;
    public          postgres    false    229   �                 0    27867    funcionario 
   TABLE DATA           x   COPY public.funcionario (id_funcionario, salario, nome, sobrenome, data_contratacao, cargo, numero_agencia) FROM stdin;
    public          postgres    false    231   E                 0    27808    locacao 
   TABLE DATA           �   COPY public.locacao (id_locacao, id_cliente, numero_agencia, data_devolucao, data_locacao, valor_total, id_pagamento) FROM stdin;
    public          postgres    false    225   C                 0    27889    ordem_manutencao 
   TABLE DATA           �   COPY public.ordem_manutencao (id_ordem_manutencao, id_manutencao, data_emissao, local, descricao, objetivo, id_carro, id_locacao, status) FROM stdin;
    public          postgres    false    233   �                 0    27794 	   pagamento 
   TABLE DATA           k   COPY public.pagamento (id_pagamento, status_pagamento, valor, forma_pagamento, data_pagamento) FROM stdin;
    public          postgres    false    222   �       %           0    0    agencia_numero_agencia_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.agencia_numero_agencia_seq', 20, true);
          public          postgres    false    217            &           0    0    carro_id_carro_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.carro_id_carro_seq', 30, true);
          public          postgres    false    226            '           0    0    cliente_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 10, true);
          public          postgres    false    215            (           0    0    comprovante_id_comprovante_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.comprovante_id_comprovante_seq', 10, true);
          public          postgres    false    219            )           0    0    feedback_id_feedback_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.feedback_id_feedback_seq', 10, true);
          public          postgres    false    228            *           0    0    funcionario_id_funcionario_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.funcionario_id_funcionario_seq', 10, true);
          public          postgres    false    230            +           0    0    locacao_id_locacao_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.locacao_id_locacao_seq', 10, true);
          public          postgres    false    223            ,           0    0    locacao_id_pagamento_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.locacao_id_pagamento_seq', 1, false);
          public          postgres    false    224            -           0    0 (   ordem_manutencao_id_ordem_manutencao_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.ordem_manutencao_id_ordem_manutencao_seq', 10, true);
          public          postgres    false    232            .           0    0    pagamento_id_pagamento_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.pagamento_id_pagamento_seq', 10, true);
          public          postgres    false    221               ^  x���͎�0���)�H��gW��F�A�E��⡮L����y��Z�O���:�d2�p7H}����G��V"/~����t���w���{~��Q���)��dY�8c\؜��TO`��w�QT��5h���=K��߫�k�!5Xl��1�������������Q9~���|k���hj���.Jr+
��3�D*�����]Tbه7w�N�}��^��Mhj�T��(��L��r9����tV�T�J���7��#}#��	�"1��4���Ȉ\ã8	�C�:a���y�$J�G<����4n@S�7�ֿ��?��#�"�/�FV�[�;��7���OѸ!�5 ���~��@�Xl�Xl�3E���+����&o��웺��KY#dH�OK���PQ��x�葱��άa���7�ֵ�k��OT{�������@�)�y�їJ
��B�>?�HlؗH�˃"N���2Y�����voR��vE��J�����v�A��[���k������{�y�V�ߨ�n}����6������v�R2ޖ���:���|�_cik̇��u��!kl���{7l��?���q��d�K�         *  x�u�[o�0 ��ï���(}��p�ԹK��L�5#4���W�I��䜖�a�f���;�ӕ������A����nV���]��Ҁ�c6_D�Lp��o{��eM��r��!�{* ��W�2��mΤ�}2қ!����OymlUvd[��>.�!O#Dx�le�(�e�/UG��9��|FPƈ�{��e���>kC��>Q��z��������A����]&�*(�L}͍i[]�Sٴ��(0�%�.i6�=�"�Fwvt���JH�/�)��n;g��ң�@:+����$��8�i         �  x�U�An�0E��S��v'�5P�B�F��ƀ[Y2v�$��:]�\�B�EE3/���`�v�f/�G�����	OE&󢤰��_;c�
v��Ԫ���~jb��qhY�2)g�Q� A��7�5>9�d��6��v�FJI:��8c��j}ıwk�8�`��O�|0�S�Yن�1�D�+˲(�*�`�C��jZ�TV��W�$QY�B�Xº;�v���ˢ��0��LP"G��(��"Â�
V��Z��u��f�Ѷ�;���L�|��GJ�D	XvM��(����`>5�s�{�HS�)FNq�7Ne���<isDUhHY����[����#��@�3�LOC�<�Bw����6�H�n}�HA5ȑ�Q9�0�ڜ���j�/���PzD>&���Oׯ         h   x�}�=
�0��99EO V[f��R�8Պ��7��d|�x,��W}�qg�ew�=�|��y;;� ����0�A�0�A�p����F';� ��`�з?O��Ƶ!���i�         ]  x�UQKN�@]Ϝ��*��v	H]W�%�8�h&�$���bQ	�%'���D�Κy_{ᆷ��@"�y8�
T�iE�ڜZ,e�6yR
���/�uKuɑj��pl�4(P������_�����&�
�+�v8�&�+�v)I�%���@��4|Q�� �g�q���[��k�q%��]���Q"�9�$��_�{�	�\���Z�Qy�2F����HP	�R��粊��&7 ��i�K��Ȅ�^�I)i�ZP��4|ԅu�:A
����]_���c���Tc�`�2?�ZV,���s�����w�.�pT���.��|Җ���aw~q�n�Ge���%��t>{�)kq����o��5         �   x�e��j�0E�3��0��\�@��!�v3�j��r�?��za�vs������@G���e�]�� I���`�ڍ�E%(Y�pcӒ$ѿؓ���@v���b=܌�g��iV�T��'����nc��%
���c7z���+���kl@��5'c�~�o�9{����TU�+���0�I�1����b���c�9~����f��_��������Ưv����qN~*��[~�Hly3         �   x�M�K!�u�]������-�AS.��HB�H*��G�)W7�+����r�ꪣ�K =hu���
K�k��G��@g�4�t��a	t6K�G��@g�hw48a	��khs4�>�_�~D�;*,{ԟt��ʭ�{I~	@=�         �  x����n�0���~�D���1ݥ�P�����^�04���}�������:f[X�TD�`l��=&��I<��,.&1<�&5V�{L�֤Z��O��]�*��<���I*%f���2�Ց�P`�U�*�ųV�������d�K�OI4�Y�����#c��e�5ki�B���&��r�����E�A���5�
�@v��?�w���d��g�-)g�M,�_�MJ��]��wn2������	��-kp$���;���@u����pߏ�}b
�.�=���S���\2��`t�
V=� �ǃ&�	�+�TQ�M+���!��uϭ��7T�Q
���Z���l&�"+妔��'b�o`���v<������ye[��!
E|J���N@���4�E�F3?V獯B����
:��>�t��zsH��f&�e�7`I���!�ۇ������U��2���nܛ�         �   x���K�0E�}�`�����L0�ā�
�H*�p�n��0�֘����s_.A�,�v�o�D$�ƈ	5��ഝÔ�Z9�b�8t1����yQ���ȆK7N&�Fߕ4h
�U��|�D=uJ?�F�ON,9���).�s'�a �����\OG��"�Kf��� ��R��ĐNe�R� �s�6j�ߓ ^"̓     