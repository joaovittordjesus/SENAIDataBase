PGDMP  %    3                |         
   locadoradb    16.2    16.2 A               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    27769 
   locadoradb    DATABASE     �   CREATE DATABASE locadoradb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE locadoradb;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    27778    agencia    TABLE     #  CREATE TABLE public.agencia (
    numero_agencia integer NOT NULL,
    email character varying(100) NOT NULL,
    telefone character varying(100) NOT NULL,
    endereco character varying(255) NOT NULL,
    nome character varying(100) DEFAULT 'Nome Temporario'::character varying NOT NULL
);
    DROP TABLE public.agencia;
       public         heap    postgres    false    4            �            1259    27777    agencia_numero_agencia_seq    SEQUENCE     �   CREATE SEQUENCE public.agencia_numero_agencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.agencia_numero_agencia_seq;
       public          postgres    false    218    4                       0    0    agencia_numero_agencia_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.agencia_numero_agencia_seq OWNED BY public.agencia.numero_agencia;
          public          postgres    false    217            �            1259    27833    carro    TABLE     �  CREATE TABLE public.carro (
    id_carro integer NOT NULL,
    numero_agencia integer NOT NULL,
    placa character varying(100) NOT NULL,
    modelo character varying(100) NOT NULL,
    ano date NOT NULL,
    tipo character varying(1),
    disponibilidade character varying(50) DEFAULT 'DISPONIVEL'::character varying NOT NULL,
    id_locacao integer NOT NULL,
    valor_total numeric NOT NULL
);
    DROP TABLE public.carro;
       public         heap    postgres    false    4            �            1259    27832    carro_id_carro_seq    SEQUENCE     �   CREATE SEQUENCE public.carro_id_carro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.carro_id_carro_seq;
       public          postgres    false    227    4            	           0    0    carro_id_carro_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.carro_id_carro_seq OWNED BY public.carro.id_carro;
          public          postgres    false    226            �            1259    27771    cliente    TABLE     �  CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    email character varying(100) NOT NULL,
    celular character varying(20) NOT NULL,
    nome character varying(100) NOT NULL,
    sobrenome character varying(50) NOT NULL,
    cidade character varying(100) NOT NULL,
    estado character(2) NOT NULL,
    habilitacao character varying(100) DEFAULT ''::character varying NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false    4            �            1259    27770    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public          postgres    false    216    4            
           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public          postgres    false    215            �            1259    27785    comprovante    TABLE     �   CREATE TABLE public.comprovante (
    id_comprovante integer NOT NULL,
    comprovante character varying(1000) NOT NULL,
    id_pagamento integer NOT NULL,
    id_cliente integer NOT NULL
);
    DROP TABLE public.comprovante;
       public         heap    postgres    false    4            �            1259    27784    comprovante_id_comprovante_seq    SEQUENCE     �   CREATE SEQUENCE public.comprovante_id_comprovante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.comprovante_id_comprovante_seq;
       public          postgres    false    220    4                       0    0    comprovante_id_comprovante_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.comprovante_id_comprovante_seq OWNED BY public.comprovante.id_comprovante;
          public          postgres    false    219            �            1259    27853    feedback    TABLE     �   CREATE TABLE public.feedback (
    id_feedback integer NOT NULL,
    comentario character varying(255) NOT NULL,
    avaliacao character varying(255) NOT NULL,
    id_cliente integer NOT NULL
);
    DROP TABLE public.feedback;
       public         heap    postgres    false    4            �            1259    27852    feedback_id_feedback_seq    SEQUENCE     �   CREATE SEQUENCE public.feedback_id_feedback_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.feedback_id_feedback_seq;
       public          postgres    false    229    4                       0    0    feedback_id_feedback_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.feedback_id_feedback_seq OWNED BY public.feedback.id_feedback;
          public          postgres    false    228            �            1259    27867    funcionario    TABLE     9  CREATE TABLE public.funcionario (
    id_funcionario integer NOT NULL,
    salario numeric(10,2) NOT NULL,
    nome character varying(100) NOT NULL,
    sobrenome character varying(100) NOT NULL,
    data_contratacao date NOT NULL,
    cargo character varying(50) NOT NULL,
    numero_agencia integer NOT NULL
);
    DROP TABLE public.funcionario;
       public         heap    postgres    false    4            �            1259    27866    funcionario_id_funcionario_seq    SEQUENCE     �   CREATE SEQUENCE public.funcionario_id_funcionario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.funcionario_id_funcionario_seq;
       public          postgres    false    4    231                       0    0    funcionario_id_funcionario_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.funcionario_id_funcionario_seq OWNED BY public.funcionario.id_funcionario;
          public          postgres    false    230            �            1259    27808    locacao    TABLE     >  CREATE TABLE public.locacao (
    id_locacao integer NOT NULL,
    id_cliente integer NOT NULL,
    numero_agencia integer NOT NULL,
    data_devolucao date DEFAULT CURRENT_DATE NOT NULL,
    data_locacao date DEFAULT CURRENT_DATE NOT NULL,
    valor_total numeric(10,2) NOT NULL,
    id_pagamento integer NOT NULL
);
    DROP TABLE public.locacao;
       public         heap    postgres    false    4            �            1259    27806    locacao_id_locacao_seq    SEQUENCE     �   CREATE SEQUENCE public.locacao_id_locacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.locacao_id_locacao_seq;
       public          postgres    false    4    225                       0    0    locacao_id_locacao_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.locacao_id_locacao_seq OWNED BY public.locacao.id_locacao;
          public          postgres    false    223            �            1259    27807    locacao_id_pagamento_seq    SEQUENCE     �   CREATE SEQUENCE public.locacao_id_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.locacao_id_pagamento_seq;
       public          postgres    false    225    4                       0    0    locacao_id_pagamento_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.locacao_id_pagamento_seq OWNED BY public.locacao.id_pagamento;
          public          postgres    false    224            �            1259    27889    ordem_manutencao    TABLE     �  CREATE TABLE public.ordem_manutencao (
    id_ordem_manutencao integer NOT NULL,
    id_manutencao integer NOT NULL,
    data_emissao date DEFAULT CURRENT_DATE NOT NULL,
    local character varying(100),
    descricao character varying(1000),
    objetivo character varying(1000),
    id_carro integer NOT NULL,
    id_locacao integer NOT NULL,
    status character varying(50) DEFAULT 'PENDENTE'::character varying NOT NULL
);
 $   DROP TABLE public.ordem_manutencao;
       public         heap    postgres    false    4            �            1259    27888 (   ordem_manutencao_id_ordem_manutencao_seq    SEQUENCE     �   CREATE SEQUENCE public.ordem_manutencao_id_ordem_manutencao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.ordem_manutencao_id_ordem_manutencao_seq;
       public          postgres    false    233    4                       0    0 (   ordem_manutencao_id_ordem_manutencao_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.ordem_manutencao_id_ordem_manutencao_seq OWNED BY public.ordem_manutencao.id_ordem_manutencao;
          public          postgres    false    232            �            1259    27794 	   pagamento    TABLE       CREATE TABLE public.pagamento (
    id_pagamento integer NOT NULL,
    status_pagamento character varying(100) DEFAULT 'PENDENTE'::character varying NOT NULL,
    valor numeric(10,2) NOT NULL,
    forma_pagamento character varying(100) NOT NULL,
    data_pagamento date NOT NULL
);
    DROP TABLE public.pagamento;
       public         heap    postgres    false    4            �            1259    27793    pagamento_id_pagamento_seq    SEQUENCE     �   CREATE SEQUENCE public.pagamento_id_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.pagamento_id_pagamento_seq;
       public          postgres    false    4    222                       0    0    pagamento_id_pagamento_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.pagamento_id_pagamento_seq OWNED BY public.pagamento.id_pagamento;
          public          postgres    false    221            E           2604    27781    agencia numero_agencia    DEFAULT     �   ALTER TABLE ONLY public.agencia ALTER COLUMN numero_agencia SET DEFAULT nextval('public.agencia_numero_agencia_seq'::regclass);
 E   ALTER TABLE public.agencia ALTER COLUMN numero_agencia DROP DEFAULT;
       public          postgres    false    218    217    218            N           2604    27836    carro id_carro    DEFAULT     p   ALTER TABLE ONLY public.carro ALTER COLUMN id_carro SET DEFAULT nextval('public.carro_id_carro_seq'::regclass);
 =   ALTER TABLE public.carro ALTER COLUMN id_carro DROP DEFAULT;
       public          postgres    false    227    226    227            C           2604    27774    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    215    216    216            G           2604    27788    comprovante id_comprovante    DEFAULT     �   ALTER TABLE ONLY public.comprovante ALTER COLUMN id_comprovante SET DEFAULT nextval('public.comprovante_id_comprovante_seq'::regclass);
 I   ALTER TABLE public.comprovante ALTER COLUMN id_comprovante DROP DEFAULT;
       public          postgres    false    219    220    220            P           2604    27856    feedback id_feedback    DEFAULT     |   ALTER TABLE ONLY public.feedback ALTER COLUMN id_feedback SET DEFAULT nextval('public.feedback_id_feedback_seq'::regclass);
 C   ALTER TABLE public.feedback ALTER COLUMN id_feedback DROP DEFAULT;
       public          postgres    false    228    229    229            Q           2604    27870    funcionario id_funcionario    DEFAULT     �   ALTER TABLE ONLY public.funcionario ALTER COLUMN id_funcionario SET DEFAULT nextval('public.funcionario_id_funcionario_seq'::regclass);
 I   ALTER TABLE public.funcionario ALTER COLUMN id_funcionario DROP DEFAULT;
       public          postgres    false    230    231    231            J           2604    27811    locacao id_locacao    DEFAULT     x   ALTER TABLE ONLY public.locacao ALTER COLUMN id_locacao SET DEFAULT nextval('public.locacao_id_locacao_seq'::regclass);
 A   ALTER TABLE public.locacao ALTER COLUMN id_locacao DROP DEFAULT;
       public          postgres    false    223    225    225            M           2604    27814    locacao id_pagamento    DEFAULT     |   ALTER TABLE ONLY public.locacao ALTER COLUMN id_pagamento SET DEFAULT nextval('public.locacao_id_pagamento_seq'::regclass);
 C   ALTER TABLE public.locacao ALTER COLUMN id_pagamento DROP DEFAULT;
       public          postgres    false    224    225    225            R           2604    27892 $   ordem_manutencao id_ordem_manutencao    DEFAULT     �   ALTER TABLE ONLY public.ordem_manutencao ALTER COLUMN id_ordem_manutencao SET DEFAULT nextval('public.ordem_manutencao_id_ordem_manutencao_seq'::regclass);
 S   ALTER TABLE public.ordem_manutencao ALTER COLUMN id_ordem_manutencao DROP DEFAULT;
       public          postgres    false    233    232    233            H           2604    27797    pagamento id_pagamento    DEFAULT     �   ALTER TABLE ONLY public.pagamento ALTER COLUMN id_pagamento SET DEFAULT nextval('public.pagamento_id_pagamento_seq'::regclass);
 E   ALTER TABLE public.pagamento ALTER COLUMN id_pagamento DROP DEFAULT;
       public          postgres    false    222    221    222            X           2606    27783    agencia agencia_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.agencia
    ADD CONSTRAINT agencia_pkey PRIMARY KEY (numero_agencia);
 >   ALTER TABLE ONLY public.agencia DROP CONSTRAINT agencia_pkey;
       public            postgres    false    218            `           2606    27841    carro carro_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.carro
    ADD CONSTRAINT carro_pkey PRIMARY KEY (id_carro);
 :   ALTER TABLE ONLY public.carro DROP CONSTRAINT carro_pkey;
       public            postgres    false    227            V           2606    27776    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    216            Z           2606    27792    comprovante comprovante_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.comprovante
    ADD CONSTRAINT comprovante_pkey PRIMARY KEY (id_comprovante);
 F   ALTER TABLE ONLY public.comprovante DROP CONSTRAINT comprovante_pkey;
       public            postgres    false    220            b           2606    27860    feedback feedback_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id_feedback);
 @   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_pkey;
       public            postgres    false    229            d           2606    27872    funcionario funcionario_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id_funcionario);
 F   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_pkey;
       public            postgres    false    231            ^           2606    27816    locacao locacao_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT locacao_pkey PRIMARY KEY (id_locacao);
 >   ALTER TABLE ONLY public.locacao DROP CONSTRAINT locacao_pkey;
       public            postgres    false    225            f           2606    27897 &   ordem_manutencao ordem_manutencao_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.ordem_manutencao
    ADD CONSTRAINT ordem_manutencao_pkey PRIMARY KEY (id_ordem_manutencao);
 P   ALTER TABLE ONLY public.ordem_manutencao DROP CONSTRAINT ordem_manutencao_pkey;
       public            postgres    false    233            \           2606    27800    pagamento pagamento_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (id_pagamento);
 B   ALTER TABLE ONLY public.pagamento DROP CONSTRAINT pagamento_pkey;
       public            postgres    false    222            l           2606    27847    carro carro_id_locacao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carro
    ADD CONSTRAINT carro_id_locacao_fkey FOREIGN KEY (id_locacao) REFERENCES public.locacao(id_locacao);
 E   ALTER TABLE ONLY public.carro DROP CONSTRAINT carro_id_locacao_fkey;
       public          postgres    false    4702    225    227            m           2606    27842    carro carro_numero_agencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carro
    ADD CONSTRAINT carro_numero_agencia_fkey FOREIGN KEY (numero_agencia) REFERENCES public.agencia(numero_agencia);
 I   ALTER TABLE ONLY public.carro DROP CONSTRAINT carro_numero_agencia_fkey;
       public          postgres    false    218    227    4696            n           2606    27861 !   feedback feedback_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 K   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_id_cliente_fkey;
       public          postgres    false    216    229    4694            o           2606    27873 +   funcionario funcionario_numero_agencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_numero_agencia_fkey FOREIGN KEY (numero_agencia) REFERENCES public.agencia(numero_agencia);
 U   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_numero_agencia_fkey;
       public          postgres    false    231    4696    218            g           2606    27927    comprovante id_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.comprovante
    ADD CONSTRAINT id_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 @   ALTER TABLE ONLY public.comprovante DROP CONSTRAINT id_cliente;
       public          postgres    false    4694    216    220            h           2606    27922    comprovante id_pagamento    FK CONSTRAINT     �   ALTER TABLE ONLY public.comprovante
    ADD CONSTRAINT id_pagamento FOREIGN KEY (id_pagamento) REFERENCES public.pagamento(id_pagamento);
 B   ALTER TABLE ONLY public.comprovante DROP CONSTRAINT id_pagamento;
       public          postgres    false    222    220    4700            i           2606    27817    locacao locacao_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT locacao_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 I   ALTER TABLE ONLY public.locacao DROP CONSTRAINT locacao_id_cliente_fkey;
       public          postgres    false    4694    216    225            j           2606    27827 !   locacao locacao_id_pagamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT locacao_id_pagamento_fkey FOREIGN KEY (id_pagamento) REFERENCES public.pagamento(id_pagamento);
 K   ALTER TABLE ONLY public.locacao DROP CONSTRAINT locacao_id_pagamento_fkey;
       public          postgres    false    225    222    4700            k           2606    27822 #   locacao locacao_numero_agencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT locacao_numero_agencia_fkey FOREIGN KEY (numero_agencia) REFERENCES public.agencia(numero_agencia);
 M   ALTER TABLE ONLY public.locacao DROP CONSTRAINT locacao_numero_agencia_fkey;
       public          postgres    false    4696    218    225            p           2606    27908 /   ordem_manutencao ordem_manutencao_id_carro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordem_manutencao
    ADD CONSTRAINT ordem_manutencao_id_carro_fkey FOREIGN KEY (id_carro) REFERENCES public.carro(id_carro);
 Y   ALTER TABLE ONLY public.ordem_manutencao DROP CONSTRAINT ordem_manutencao_id_carro_fkey;
       public          postgres    false    227    4704    233            q           2606    27903 1   ordem_manutencao ordem_manutencao_id_locacao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordem_manutencao
    ADD CONSTRAINT ordem_manutencao_id_locacao_fkey FOREIGN KEY (id_locacao) REFERENCES public.locacao(id_locacao);
 [   ALTER TABLE ONLY public.ordem_manutencao DROP CONSTRAINT ordem_manutencao_id_locacao_fkey;
       public          postgres    false    225    233    4702           