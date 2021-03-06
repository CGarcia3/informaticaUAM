PGDMP     %    (            	    v           p1_tweet    10.5    10.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16878    p1_tweet    DATABASE     �   CREATE DATABASE p1_tweet WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE p1_tweet;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    17215    follows    TABLE     c   CREATE TABLE public.follows (
    id_seguidor integer NOT NULL,
    id_seguido integer NOT NULL
);
    DROP TABLE public.follows;
       public         postgres    false    3            �            1259    17218    follows_temp    TABLE     �   CREATE TABLE public.follows_temp (
    follower_id integer NOT NULL,
    follower_name character varying(50),
    followee_id integer NOT NULL,
    followee_name character varying(50)
);
     DROP TABLE public.follows_temp;
       public         postgres    false    3            �            1259    17221    retweets    TABLE     �   CREATE TABLE public.retweets (
    id_tweet_original character varying(50) NOT NULL,
    id_tweet integer NOT NULL,
    id_autor integer
);
    DROP TABLE public.retweets;
       public         postgres    false    3            �            1259    17224    tweets    TABLE     �   CREATE TABLE public.tweets (
    id integer NOT NULL,
    texto character varying(250),
    localizacion character varying(50),
    fecha date,
    id_autor integer
);
    DROP TABLE public.tweets;
       public         postgres    false    3            �            1259    17227    tweets_temp    TABLE     -  CREATE TABLE public.tweets_temp (
    id_usuario integer,
    nombre_usuario character varying(50),
    localizacion character varying(50),
    fecha_registro_usuario date,
    id_tweet integer NOT NULL,
    fecha_tweet date,
    texto character varying(250),
    id_original character varying(50)
);
    DROP TABLE public.tweets_temp;
       public         postgres    false    3            �            1259    17230    usuarios    TABLE     u   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(50),
    fecha_registro date
);
    DROP TABLE public.usuarios;
       public         postgres    false    3            	          0    17215    follows 
   TABLE DATA               :   COPY public.follows (id_seguidor, id_seguido) FROM stdin;
    public       postgres    false    196   i        
          0    17218    follows_temp 
   TABLE DATA               ^   COPY public.follows_temp (follower_id, follower_name, followee_id, followee_name) FROM stdin;
    public       postgres    false    197   �                  0    17221    retweets 
   TABLE DATA               I   COPY public.retweets (id_tweet_original, id_tweet, id_autor) FROM stdin;
    public       postgres    false    198   e!                 0    17224    tweets 
   TABLE DATA               J   COPY public.tweets (id, texto, localizacion, fecha, id_autor) FROM stdin;
    public       postgres    false    199   �!                 0    17227    tweets_temp 
   TABLE DATA               �   COPY public.tweets_temp (id_usuario, nombre_usuario, localizacion, fecha_registro_usuario, id_tweet, fecha_tweet, texto, id_original) FROM stdin;
    public       postgres    false    200   a#                 0    17230    usuarios 
   TABLE DATA               >   COPY public.usuarios (id, nombre, fecha_registro) FROM stdin;
    public       postgres    false    201   �%       �
           2606    17234    follows follows_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id_seguidor, id_seguido);
 >   ALTER TABLE ONLY public.follows DROP CONSTRAINT follows_pkey;
       public         postgres    false    196    196            �
           2606    17236    follows_temp follows_temp_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.follows_temp
    ADD CONSTRAINT follows_temp_pkey PRIMARY KEY (follower_id, followee_id);
 H   ALTER TABLE ONLY public.follows_temp DROP CONSTRAINT follows_temp_pkey;
       public         postgres    false    197    197            �
           2606    17238    retweets retweets_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.retweets
    ADD CONSTRAINT retweets_pkey PRIMARY KEY (id_tweet, id_tweet_original);
 @   ALTER TABLE ONLY public.retweets DROP CONSTRAINT retweets_pkey;
       public         postgres    false    198    198            �
           2606    17240    tweets tweets_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tweets
    ADD CONSTRAINT tweets_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tweets DROP CONSTRAINT tweets_pkey;
       public         postgres    false    199            �
           2606    17242    tweets_temp tweets_temp_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tweets_temp
    ADD CONSTRAINT tweets_temp_pkey PRIMARY KEY (id_tweet);
 F   ALTER TABLE ONLY public.tweets_temp DROP CONSTRAINT tweets_temp_pkey;
       public         postgres    false    200            �
           2606    17244    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    201            �
           2606    17245    follows follows_id_seguido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_id_seguido_fkey FOREIGN KEY (id_seguido) REFERENCES public.usuarios(id);
 I   ALTER TABLE ONLY public.follows DROP CONSTRAINT follows_id_seguido_fkey;
       public       postgres    false    196    201    2699            �
           2606    17250     follows follows_id_seguidor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_id_seguidor_fkey FOREIGN KEY (id_seguidor) REFERENCES public.usuarios(id);
 J   ALTER TABLE ONLY public.follows DROP CONSTRAINT follows_id_seguidor_fkey;
       public       postgres    false    201    196    2699            �
           2606    17260    retweets retweets_id_autor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.retweets
    ADD CONSTRAINT retweets_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES public.usuarios(id);
 I   ALTER TABLE ONLY public.retweets DROP CONSTRAINT retweets_id_autor_fkey;
       public       postgres    false    198    2699    201            �
           2606    17255    tweets tweets_id_autor_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.tweets
    ADD CONSTRAINT tweets_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES public.usuarios(id);
 E   ALTER TABLE ONLY public.tweets DROP CONSTRAINT tweets_id_autor_fkey;
       public       postgres    false    199    2699    201            	   ?   x�-��  C�o�Pwq�9,�_'7)�����<�4䥃��2��B��V���C��u3�Ŷ;      
   �   x�m���0���Ø֟��bBPYֵ�K����D]ko��8ka�G g�p�1�H}�l��A{�I�2�e)>�����^�D0Pf��4e¯�|Cb���5	�g��@�2N�V֖��|�.�d/���8m^_V��'��2�)"5oؼ����P��1/,_�P         9   x�%��  �7c �B/�_��&�5=db�"l�w��Z��Sv8���[��ٚ�         �  x�}�OO�0�ϓO1{�K�n��@�D%����e/n;4i\�^P���8X�R@��~��{cYK+Z��08�f�=�5u�-U-d#�%e���+
��]���J�2��~ȕBb���g��@�Lh�k�h�hQ�U��3��Eg����R�jK�s?��	h=r=?�v���sP-d̰`��+����&��7$;+N������f3�Ti.t�P�Psf�rO�۵��kڈ��V~p�q��������Jȅ�e�����o�f�opczg�������:B�_�9ܷ.:-/^�TU$d���h�;
xhm����tpk����W/�kV�Ľ�:��;�-+$��߆E�I��quMB+�{��׼f��|�:�5�t�[z��ԍ_��IҜ���|KR����RGt�dD5I��Y����         %  x���Qo�0��o~����a'@x�VuR#u����TB&�	nF�b�~�$��*I%06�~�{��!����ݢ.�0�a���ܝ����BUfke�N�?= 	x7h-6�2v��g���8�(�rW|��T���U����[��ظ�4�a�e�\q䊅�;�Ƭ��+2�� ^����V���B�mJ�(<�M��|NL&������J묔�&?�Q+W��4vK�@8꣩[*�e�e�j��rV�K"�ܘ|��H�:�(�fW֙�����;#7��p��{si���31�Jc��(�����M�rմ۷��dP�Y<<����h��U�q-#��K��M�v-�����!w�˛�:;I�y�����!�\�}ü���9S=��D�T��ű�s�U�m)D�K�K�q��}:��8��h�Z�j�A��Bi��,�x)X���8���Z2?:]S���#G�����}C��U�����QW�rM.x\�Rv9��O��'U1�m�V�V����O�K�U�.T�kh���9��1�Ϫ�^��d4�X��         �   x�U�Q� ��r��t�Kx��E����011i��~)�LOw�A��FԤ�R������#2!q�kx&��_}IQ�1������.�$Wb�>�P�kYmO�oH��8��l�*���;ByHHѿ�oA֨N�b����WԠ�����/ڙiMSSvq���Vj��.;��B(E�     