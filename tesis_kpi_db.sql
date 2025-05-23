PGDMP                       }            tesis_kpi_db    17.4    17.4 \    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16389    tesis_kpi_db    DATABASE     r   CREATE DATABASE tesis_kpi_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE tesis_kpi_db;
                     tesis_api_user    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                     tesis_api_user    false            k           1247    28056    kpi_category_enum    TYPE     �   CREATE TYPE public.kpi_category_enum AS ENUM (
    'perforacion',
    'produccion',
    'logistica',
    'seguridad',
    'financiero',
    'otro'
);
 $   DROP TYPE public.kpi_category_enum;
       public               tesis_api_user    false    5            h           1247    28048    kpi_trend_enum    TYPE     R   CREATE TYPE public.kpi_trend_enum AS ENUM (
    'up',
    'down',
    'stable'
);
 !   DROP TYPE public.kpi_trend_enum;
       public               tesis_api_user    false    5            w           1247    28128    transaction_type_enum    TYPE     \   CREATE TYPE public.transaction_type_enum AS ENUM (
    'IN',
    'OUT',
    'ADJUSTMENT'
);
 (   DROP TYPE public.transaction_type_enum;
       public               tesis_api_user    false    5            �            1259    28029    ai_logs    TABLE       CREATE TABLE public.ai_logs (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT now(),
    user_id integer,
    feature_area character varying NOT NULL,
    input_data text,
    output_data text,
    decision_reason text,
    metrics jsonb
);
    DROP TABLE public.ai_logs;
       public         heap r       tesis_api_user    false    5            �           0    0    COLUMN ai_logs.feature_area    COMMENT     e   COMMENT ON COLUMN public.ai_logs.feature_area IS 'Ej: InventoryRestock, KpiAnalysis, UserProfiling';
          public               tesis_api_user    false    223            �            1259    28028    ai_logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ai_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ai_logs_id_seq;
       public               tesis_api_user    false    223    5            �           0    0    ai_logs_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ai_logs_id_seq OWNED BY public.ai_logs.id;
          public               tesis_api_user    false    222            �            1259    24580    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap r       tesis_api_user    false    5            �            1259    28005 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);
    DROP TABLE public.categories;
       public         heap r       tesis_api_user    false    5            �            1259    28004    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public               tesis_api_user    false    5    219            �           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public               tesis_api_user    false    218            �            1259    28070    kpis    TABLE     �  CREATE TABLE public.kpis (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    value numeric(15,5) NOT NULL,
    target numeric(15,5),
    unit character varying NOT NULL,
    trend public.kpi_trend_enum,
    category public.kpi_category_enum NOT NULL,
    last_updated timestamp with time zone DEFAULT now(),
    owner_id integer,
    created_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.kpis;
       public         heap r       tesis_api_user    false    872    875    5            �            1259    28069    kpis_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kpis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.kpis_id_seq;
       public               tesis_api_user    false    5    225            �           0    0    kpis_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.kpis_id_seq OWNED BY public.kpis.id;
          public               tesis_api_user    false    224            �            1259    28091    products    TABLE     >  CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    price numeric(10,2),
    stock integer NOT NULL,
    sku character varying,
    category_id integer,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);
    DROP TABLE public.products;
       public         heap r       tesis_api_user    false    5            �            1259    28090    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public               tesis_api_user    false    227    5            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public               tesis_api_user    false    226            �            1259    28110    profiles    TABLE        CREATE TABLE public.profiles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    full_name character varying,
    bio text,
    avatar_url character varying,
    preferences jsonb,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);
    DROP TABLE public.profiles;
       public         heap r       tesis_api_user    false    5            �            1259    28109    profiles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.profiles_id_seq;
       public               tesis_api_user    false    229    5            �           0    0    profiles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;
          public               tesis_api_user    false    228            �            1259    28136    transactions    TABLE       CREATE TABLE public.transactions (
    id integer NOT NULL,
    quantity integer NOT NULL,
    type public.transaction_type_enum NOT NULL,
    reason text,
    "timestamp" timestamp with time zone DEFAULT now(),
    product_id integer NOT NULL,
    user_id integer
);
     DROP TABLE public.transactions;
       public         heap r       tesis_api_user    false    5    887            �            1259    28135    transactions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.transactions_id_seq;
       public               tesis_api_user    false    5    231            �           0    0    transactions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;
          public               tesis_api_user    false    230            �            1259    28017    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    hashed_password character varying NOT NULL,
    is_active boolean,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);
    DROP TABLE public.users;
       public         heap r       tesis_api_user    false    5            �            1259    28016    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               tesis_api_user    false    221    5            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               tesis_api_user    false    220            �           2604    28032 
   ai_logs id    DEFAULT     h   ALTER TABLE ONLY public.ai_logs ALTER COLUMN id SET DEFAULT nextval('public.ai_logs_id_seq'::regclass);
 9   ALTER TABLE public.ai_logs ALTER COLUMN id DROP DEFAULT;
       public               tesis_api_user    false    223    222    223            �           2604    28008    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public               tesis_api_user    false    219    218    219            �           2604    28073    kpis id    DEFAULT     b   ALTER TABLE ONLY public.kpis ALTER COLUMN id SET DEFAULT nextval('public.kpis_id_seq'::regclass);
 6   ALTER TABLE public.kpis ALTER COLUMN id DROP DEFAULT;
       public               tesis_api_user    false    225    224    225            �           2604    28094    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public               tesis_api_user    false    227    226    227            �           2604    28113    profiles id    DEFAULT     j   ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);
 :   ALTER TABLE public.profiles ALTER COLUMN id DROP DEFAULT;
       public               tesis_api_user    false    228    229    229            �           2604    28139    transactions id    DEFAULT     r   ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);
 >   ALTER TABLE public.transactions ALTER COLUMN id DROP DEFAULT;
       public               tesis_api_user    false    231    230    231            �           2604    28020    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               tesis_api_user    false    220    221    221            �          0    28029    ai_logs 
   TABLE DATA           |   COPY public.ai_logs (id, "timestamp", user_id, feature_area, input_data, output_data, decision_reason, metrics) FROM stdin;
    public               tesis_api_user    false    223   �j       �          0    24580    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public               tesis_api_user    false    217   k       �          0    28005 
   categories 
   TABLE DATA           S   COPY public.categories (id, name, description, created_at, updated_at) FROM stdin;
    public               tesis_api_user    false    219   <k       �          0    28070    kpis 
   TABLE DATA              COPY public.kpis (id, name, description, value, target, unit, trend, category, last_updated, owner_id, created_at) FROM stdin;
    public               tesis_api_user    false    225   Yk       �          0    28091    products 
   TABLE DATA           q   COPY public.products (id, name, description, price, stock, sku, category_id, created_at, updated_at) FROM stdin;
    public               tesis_api_user    false    227   vk       �          0    28110    profiles 
   TABLE DATA           p   COPY public.profiles (id, user_id, full_name, bio, avatar_url, preferences, created_at, updated_at) FROM stdin;
    public               tesis_api_user    false    229   �k       �          0    28136    transactions 
   TABLE DATA           d   COPY public.transactions (id, quantity, type, reason, "timestamp", product_id, user_id) FROM stdin;
    public               tesis_api_user    false    231   l       �          0    28017    users 
   TABLE DATA           ^   COPY public.users (id, email, hashed_password, is_active, created_at, updated_at) FROM stdin;
    public               tesis_api_user    false    221    l       �           0    0    ai_logs_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.ai_logs_id_seq', 1, false);
          public               tesis_api_user    false    222            �           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 1, false);
          public               tesis_api_user    false    218            �           0    0    kpis_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.kpis_id_seq', 1, false);
          public               tesis_api_user    false    224            �           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public               tesis_api_user    false    226            �           0    0    profiles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.profiles_id_seq', 1, true);
          public               tesis_api_user    false    228            �           0    0    transactions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.transactions_id_seq', 1, false);
          public               tesis_api_user    false    230            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public               tesis_api_user    false    220            �           2606    28037    ai_logs ai_logs_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ai_logs
    ADD CONSTRAINT ai_logs_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ai_logs DROP CONSTRAINT ai_logs_pkey;
       public                 tesis_api_user    false    223            �           2606    24584 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public                 tesis_api_user    false    217            �           2606    28013    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public                 tesis_api_user    false    219            �           2606    28079    kpis kpis_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.kpis
    ADD CONSTRAINT kpis_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.kpis DROP CONSTRAINT kpis_pkey;
       public                 tesis_api_user    false    225            �           2606    28099    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public                 tesis_api_user    false    227            �           2606    28118    profiles profiles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_pkey;
       public                 tesis_api_user    false    229            �           2606    28144    transactions transactions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_pkey;
       public                 tesis_api_user    false    231            �           2606    28025    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 tesis_api_user    false    221            �           1259    28043    ix_ai_logs_feature_area    INDEX     S   CREATE INDEX ix_ai_logs_feature_area ON public.ai_logs USING btree (feature_area);
 +   DROP INDEX public.ix_ai_logs_feature_area;
       public                 tesis_api_user    false    223            �           1259    28044    ix_ai_logs_id    INDEX     ?   CREATE INDEX ix_ai_logs_id ON public.ai_logs USING btree (id);
 !   DROP INDEX public.ix_ai_logs_id;
       public                 tesis_api_user    false    223            �           1259    28045    ix_ai_logs_timestamp    INDEX     O   CREATE INDEX ix_ai_logs_timestamp ON public.ai_logs USING btree ("timestamp");
 (   DROP INDEX public.ix_ai_logs_timestamp;
       public                 tesis_api_user    false    223            �           1259    28046    ix_ai_logs_user_id    INDEX     I   CREATE INDEX ix_ai_logs_user_id ON public.ai_logs USING btree (user_id);
 &   DROP INDEX public.ix_ai_logs_user_id;
       public                 tesis_api_user    false    223            �           1259    28014    ix_categories_id    INDEX     E   CREATE INDEX ix_categories_id ON public.categories USING btree (id);
 $   DROP INDEX public.ix_categories_id;
       public                 tesis_api_user    false    219            �           1259    28015    ix_categories_name    INDEX     P   CREATE UNIQUE INDEX ix_categories_name ON public.categories USING btree (name);
 &   DROP INDEX public.ix_categories_name;
       public                 tesis_api_user    false    219            �           1259    28085    ix_kpis_category    INDEX     E   CREATE INDEX ix_kpis_category ON public.kpis USING btree (category);
 $   DROP INDEX public.ix_kpis_category;
       public                 tesis_api_user    false    225            �           1259    28086 
   ix_kpis_id    INDEX     9   CREATE INDEX ix_kpis_id ON public.kpis USING btree (id);
    DROP INDEX public.ix_kpis_id;
       public                 tesis_api_user    false    225            �           1259    28087    ix_kpis_last_updated    INDEX     M   CREATE INDEX ix_kpis_last_updated ON public.kpis USING btree (last_updated);
 (   DROP INDEX public.ix_kpis_last_updated;
       public                 tesis_api_user    false    225            �           1259    28088    ix_kpis_name    INDEX     =   CREATE INDEX ix_kpis_name ON public.kpis USING btree (name);
     DROP INDEX public.ix_kpis_name;
       public                 tesis_api_user    false    225            �           1259    28089    ix_kpis_owner_id    INDEX     E   CREATE INDEX ix_kpis_owner_id ON public.kpis USING btree (owner_id);
 $   DROP INDEX public.ix_kpis_owner_id;
       public                 tesis_api_user    false    225            �           1259    28105    ix_products_category_id    INDEX     S   CREATE INDEX ix_products_category_id ON public.products USING btree (category_id);
 +   DROP INDEX public.ix_products_category_id;
       public                 tesis_api_user    false    227            �           1259    28106    ix_products_id    INDEX     A   CREATE INDEX ix_products_id ON public.products USING btree (id);
 "   DROP INDEX public.ix_products_id;
       public                 tesis_api_user    false    227            �           1259    28107    ix_products_name    INDEX     E   CREATE INDEX ix_products_name ON public.products USING btree (name);
 $   DROP INDEX public.ix_products_name;
       public                 tesis_api_user    false    227            �           1259    28108    ix_products_sku    INDEX     J   CREATE UNIQUE INDEX ix_products_sku ON public.products USING btree (sku);
 #   DROP INDEX public.ix_products_sku;
       public                 tesis_api_user    false    227            �           1259    28124    ix_profiles_full_name    INDEX     O   CREATE INDEX ix_profiles_full_name ON public.profiles USING btree (full_name);
 )   DROP INDEX public.ix_profiles_full_name;
       public                 tesis_api_user    false    229            �           1259    28125    ix_profiles_id    INDEX     A   CREATE INDEX ix_profiles_id ON public.profiles USING btree (id);
 "   DROP INDEX public.ix_profiles_id;
       public                 tesis_api_user    false    229            �           1259    28126    ix_profiles_user_id    INDEX     R   CREATE UNIQUE INDEX ix_profiles_user_id ON public.profiles USING btree (user_id);
 '   DROP INDEX public.ix_profiles_user_id;
       public                 tesis_api_user    false    229            �           1259    28155    ix_transactions_id    INDEX     I   CREATE INDEX ix_transactions_id ON public.transactions USING btree (id);
 &   DROP INDEX public.ix_transactions_id;
       public                 tesis_api_user    false    231            �           1259    28156    ix_transactions_product_id    INDEX     Y   CREATE INDEX ix_transactions_product_id ON public.transactions USING btree (product_id);
 .   DROP INDEX public.ix_transactions_product_id;
       public                 tesis_api_user    false    231            �           1259    28157    ix_transactions_timestamp    INDEX     Y   CREATE INDEX ix_transactions_timestamp ON public.transactions USING btree ("timestamp");
 -   DROP INDEX public.ix_transactions_timestamp;
       public                 tesis_api_user    false    231            �           1259    28158    ix_transactions_user_id    INDEX     S   CREATE INDEX ix_transactions_user_id ON public.transactions USING btree (user_id);
 +   DROP INDEX public.ix_transactions_user_id;
       public                 tesis_api_user    false    231            �           1259    28026    ix_users_email    INDEX     H   CREATE UNIQUE INDEX ix_users_email ON public.users USING btree (email);
 "   DROP INDEX public.ix_users_email;
       public                 tesis_api_user    false    221            �           1259    28027    ix_users_id    INDEX     ;   CREATE INDEX ix_users_id ON public.users USING btree (id);
    DROP INDEX public.ix_users_id;
       public                 tesis_api_user    false    221            �           2606    28038    ai_logs ai_logs_user_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.ai_logs
    ADD CONSTRAINT ai_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.ai_logs DROP CONSTRAINT ai_logs_user_id_fkey;
       public               tesis_api_user    false    221    223    4810            �           2606    28080    kpis kpis_owner_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.kpis
    ADD CONSTRAINT kpis_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);
 A   ALTER TABLE ONLY public.kpis DROP CONSTRAINT kpis_owner_id_fkey;
       public               tesis_api_user    false    225    4810    221            �           2606    28100 "   products products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_category_id_fkey;
       public               tesis_api_user    false    4804    219    227            �           2606    28119    profiles profiles_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_user_id_fkey;
       public               tesis_api_user    false    4810    229    221            �           2606    28145 )   transactions transactions_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);
 S   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_product_id_fkey;
       public               tesis_api_user    false    231    4829    227            �           2606    28150 &   transactions transactions_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_user_id_fkey;
       public               tesis_api_user    false    4810    231    221            '           826    16390    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     c   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO tesis_api_user;
          public               postgres    false    5            �      x������ � �      �      x��4�L6N35O65K����� *��      �      x������ � �      �      x������ � �      �      x������ � �      �   `   x�3�4�t+J�������H�M*JM�,.)��K�VJLI�,���K�	(�/0T�R����4202�5 "+Cs+C=#K#m�?�=... ���      �      x������ � �      �   {   x�3�,IM)q(I-.�K���T1JR14R1tK3.K
q4�rJ�//)(pv��3�H/-���I�6��t��pN)���.ssr64,�,�4202�5 "+Cs+C=#K#m�?�=... `4 �     