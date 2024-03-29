PGDMP      9                {            postgres    16.1    16.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    5078                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1255    16801    calculate_square(integer)    FUNCTION     �   CREATE FUNCTION public.calculate_square(in_number integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  square INT;
BEGIN
  square := in_number * in_number;
  RETURN square;
END;
$$;
 :   DROP FUNCTION public.calculate_square(in_number integer);
       public          postgres    false            �            1259    16458    car    TABLE     �   CREATE TABLE public.car (
    tag character(8) NOT NULL,
    car_owner character(10),
    color character varying(15),
    chassis_number character(17),
    brand character varying(20),
    transpot_network_name character varying(10)
);
    DROP TABLE public.car;
       public         heap    postgres    false            �            1259    16402    citizen    TABLE     Q  CREATE TABLE public.citizen (
    first_name character varying(20),
    last_name character varying(20),
    birth_date date,
    gender character(1),
    national_code character(10) NOT NULL,
    overseer_citizen_id character(10) NOT NULL,
    CONSTRAINT citizen_gender_check CHECK ((gender = ANY (ARRAY['F'::bpchar, 'M'::bpchar])))
);
    DROP TABLE public.citizen;
       public         heap    postgres    false            �            1259    16408    citizen_account    TABLE     �   CREATE TABLE public.citizen_account (
    citizen_id character(10) NOT NULL,
    credit integer,
    payment integer,
    deposit integer
);
 #   DROP TABLE public.citizen_account;
       public         heap    postgres    false            �            1259    17142    citizen_visit    TABLE     �   CREATE TABLE public.citizen_visit (
    visit_id integer NOT NULL,
    national_code character(10),
    station_id character varying(20),
    visit_date timestamp without time zone
);
 !   DROP TABLE public.citizen_visit;
       public         heap    postgres    false            �            1259    17141    citizen_visit_visit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.citizen_visit_visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.citizen_visit_visit_id_seq;
       public          postgres    false    239            �           0    0    citizen_visit_visit_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.citizen_visit_visit_id_seq OWNED BY public.citizen_visit.visit_id;
          public          postgres    false    238            �            1259    16441    city_service_receipt    TABLE     �   CREATE TABLE public.city_service_receipt (
    city_service_receipt_id integer NOT NULL,
    type_service character(11),
    national_id character(10)
);
 (   DROP TABLE public.city_service_receipt;
       public         heap    postgres    false            �            1259    17097    driving    TABLE       CREATE TABLE public.driving (
    national_id character(10) NOT NULL,
    car_tag character(10),
    covered_distance integer,
    driving_time timestamp without time zone,
    drive_date date,
    CONSTRAINT driving_covered_distance_check CHECK ((covered_distance > 0))
);
    DROP TABLE public.driving;
       public         heap    postgres    false            �            1259    17076    driving_citizen    TABLE     m   CREATE TABLE public.driving_citizen (
    national_code character(10) NOT NULL,
    city_id character(10)
);
 #   DROP TABLE public.driving_citizen;
       public         heap    postgres    false            �            1259    16593    home    TABLE     �   CREATE TABLE public.home (
    city_id character(10) NOT NULL,
    address character varying(200),
    x_location integer,
    y_location integer,
    national_id character(10)
);
    DROP TABLE public.home;
       public         heap    postgres    false            �            1259    16583 
   home_owner    TABLE     K   CREATE TABLE public.home_owner (
    national_id character(10) NOT NULL
);
    DROP TABLE public.home_owner;
       public         heap    postgres    false            �            1259    16605    parking    TABLE     �  CREATE TABLE public.parking (
    city_id character(10) NOT NULL,
    parking_name character varying(100),
    start_time time without time zone,
    end_time time without time zone,
    x_location integer,
    y_location integer,
    hourly_cost integer,
    CONSTRAINT parking_check CHECK ((start_time < end_time)),
    CONSTRAINT parking_hourly_cost_check CHECK ((hourly_cost > 0))
);
    DROP TABLE public.parking;
       public         heap    postgres    false            �            1259    16918    parking_receipt    TABLE     �   CREATE TABLE public.parking_receipt (
    arrival_time timestamp without time zone,
    departure_time timestamp without time zone,
    national_code character(10),
    parking_receipt_id character(10) NOT NULL
);
 #   DROP TABLE public.parking_receipt;
       public         heap    postgres    false            �            1259    16898    parking_usage    TABLE     �   CREATE TABLE public.parking_usage (
    arrival_time timestamp without time zone NOT NULL,
    national_code character(10) NOT NULL,
    parking_city_id character(10)
);
 !   DROP TABLE public.parking_usage;
       public         heap    postgres    false            �            1259    16473    path    TABLE     �   CREATE TABLE public.path (
    path_name character varying(20),
    transpot_network_name character varying(10),
    path_id character varying(20) NOT NULL
);
    DROP TABLE public.path;
       public         heap    postgres    false            �            1259    16423    payment_receipt    TABLE       CREATE TABLE public.payment_receipt (
    receipt_code integer NOT NULL,
    payable_amount integer,
    time_of_issue timestamp without time zone,
    citizen_national_code character(10),
    service_used character varying(20),
    CONSTRAINT payment_receipt_payable_amount_check CHECK ((payable_amount >= 0)),
    CONSTRAINT payment_receipt_service_used_check CHECK (((service_used)::text = ANY ((ARRAY['travel'::character varying, 'parking'::character varying, 'city_service'::character varying])::text[])))
);
 #   DROP TABLE public.payment_receipt;
       public         heap    postgres    false            �            1259    16650    requests    TABLE     r   CREATE TABLE public.requests (
    national_id character(10) NOT NULL,
    type_service character(11) NOT NULL
);
    DROP TABLE public.requests;
       public         heap    postgres    false            �            1259    16629    services    TABLE     �   CREATE TABLE public.services (
    type_service character(11) NOT NULL,
    CONSTRAINT services_type_service_check CHECK ((type_service = ANY (ARRAY['water'::bpchar, 'gas'::bpchar, 'electricity'::bpchar])))
);
    DROP TABLE public.services;
       public         heap    postgres    false            �            1259    16635    services_usage    TABLE     �   CREATE TABLE public.services_usage (
    national_id character(10) NOT NULL,
    type_service character(11) NOT NULL,
    usage_date date,
    amount_of_usage integer
);
 "   DROP TABLE public.services_usage;
       public         heap    postgres    false            �            1259    16803    station    TABLE     �   CREATE TABLE public.station (
    station_id character(10) NOT NULL,
    station_name character varying(20),
    x_location integer,
    y_location integer
);
    DROP TABLE public.station;
       public         heap    postgres    false            �            1259    16823    station_r_path    TABLE     z   CREATE TABLE public.station_r_path (
    path_id character varying(20) NOT NULL,
    station_id character(10) NOT NULL
);
 "   DROP TABLE public.station_r_path;
       public         heap    postgres    false            �            1259    16838    station_sequence    TABLE     �   CREATE TABLE public.station_sequence (
    first_station_id character(10) NOT NULL,
    second_station_id character(10),
    distance integer,
    period_of_time integer
);
 $   DROP TABLE public.station_sequence;
       public         heap    postgres    false            �            1259    16452    transport_network    TABLE     �   CREATE TABLE public.transport_network (
    transpot_network_name character varying(10) NOT NULL,
    cost_per_kilometer integer,
    CONSTRAINT transport_network_cost_per_kilometer_check CHECK ((cost_per_kilometer > 0))
);
 %   DROP TABLE public.transport_network;
       public         heap    postgres    false            �            1259    16524    travel    TABLE     �   CREATE TABLE public.travel (
    citizen_id character(10) NOT NULL,
    car_tag character(8) NOT NULL,
    origin_id character(10),
    destination_id character(10),
    travel_date timestamp without time zone NOT NULL
);
    DROP TABLE public.travel;
       public         heap    postgres    false            �            1259    16429    travel_receipt    TABLE     2  CREATE TABLE public.travel_receipt (
    travel_code integer NOT NULL,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    citizen_id character(10),
    car_tag character(8),
    travel_date date,
    CONSTRAINT travel_receipt_check CHECK ((start_time < end_time))
);
 "   DROP TABLE public.travel_receipt;
       public         heap    postgres    false            �            1259    17174    v1    VIEW     )  CREATE VIEW public.v1 AS
 SELECT citizen.national_code
   FROM (public.citizen
     JOIN public.driving ON ((citizen.national_code = driving.national_id)))
  WHERE ((driving.drive_date >= (date_trunc('month'::text, (CURRENT_DATE)::timestamp with time zone) - '1 mon'::interval)) AND (driving.car_tag IN ( SELECT driving.car_tag
           FROM public.car
          WHERE ((car.transpot_network_name)::text = 'bus'::text))))
  GROUP BY citizen.national_code
 HAVING (sum(driving.covered_distance) < (current_setting('my.vars.distance'::text))::integer);
    DROP VIEW public.v1;
       public          postgres    false    237    216    222    237    237    237            �            1259    17169    v2    VIEW     �  CREATE VIEW public.v2 AS
 SELECT station_id AS station,
    count(national_code) AS count
   FROM public.citizen_visit
  WHERE (((station_id)::bpchar IN ( SELECT station_r_path.station_id
           FROM (public.station_r_path
             JOIN public.path ON (((station_r_path.path_id)::text = (path.path_id)::text)))
          WHERE ((path.transpot_network_name)::text = 'bus'::text))) AND (visit_date >= (CURRENT_TIMESTAMP - '24:00:00'::interval)))
  GROUP BY station_id;
    DROP VIEW public.v2;
       public          postgres    false    239    223    223    232    239    239    232            �            1259    17179    v3    VIEW       CREATE VIEW public.v3 AS
 SELECT car_tag,
    count(DISTINCT citizen_id) AS count
   FROM public.travel
  WHERE (car_tag IN ( SELECT car.tag
           FROM public.car
          WHERE ((car.transpot_network_name)::text = 'metro'::text)))
  GROUP BY car_tag;
    DROP VIEW public.v3;
       public          postgres    false    222    224    222    224            �            1259    17183    v4    VIEW     �   CREATE VIEW public.v4 AS
SELECT
    NULL::character(10) AS city_id,
    NULL::character varying(200) AS address,
    NULL::integer AS x_location,
    NULL::integer AS y_location,
    NULL::character(10) AS national_id;
    DROP VIEW public.v4;
       public          postgres    false            �           2604    17145    citizen_visit visit_id    DEFAULT     �   ALTER TABLE ONLY public.citizen_visit ALTER COLUMN visit_id SET DEFAULT nextval('public.citizen_visit_visit_id_seq'::regclass);
 E   ALTER TABLE public.citizen_visit ALTER COLUMN visit_id DROP DEFAULT;
       public          postgres    false    238    239    239            �          0    16458    car 
   TABLE DATA           b   COPY public.car (tag, car_owner, color, chassis_number, brand, transpot_network_name) FROM stdin;
    public          postgres    false    222   S�       �          0    16402    citizen 
   TABLE DATA           p   COPY public.citizen (first_name, last_name, birth_date, gender, national_code, overseer_citizen_id) FROM stdin;
    public          postgres    false    216   p�       �          0    16408    citizen_account 
   TABLE DATA           O   COPY public.citizen_account (citizen_id, credit, payment, deposit) FROM stdin;
    public          postgres    false    217   ��       �          0    17142    citizen_visit 
   TABLE DATA           X   COPY public.citizen_visit (visit_id, national_code, station_id, visit_date) FROM stdin;
    public          postgres    false    239   ��       �          0    16441    city_service_receipt 
   TABLE DATA           b   COPY public.city_service_receipt (city_service_receipt_id, type_service, national_id) FROM stdin;
    public          postgres    false    220   Ǿ       �          0    17097    driving 
   TABLE DATA           c   COPY public.driving (national_id, car_tag, covered_distance, driving_time, drive_date) FROM stdin;
    public          postgres    false    237   �       �          0    17076    driving_citizen 
   TABLE DATA           A   COPY public.driving_citizen (national_code, city_id) FROM stdin;
    public          postgres    false    236   �       �          0    16593    home 
   TABLE DATA           U   COPY public.home (city_id, address, x_location, y_location, national_id) FROM stdin;
    public          postgres    false    226   �       �          0    16583 
   home_owner 
   TABLE DATA           1   COPY public.home_owner (national_id) FROM stdin;
    public          postgres    false    225   ;�       �          0    16605    parking 
   TABLE DATA           s   COPY public.parking (city_id, parking_name, start_time, end_time, x_location, y_location, hourly_cost) FROM stdin;
    public          postgres    false    227   X�       �          0    16918    parking_receipt 
   TABLE DATA           j   COPY public.parking_receipt (arrival_time, departure_time, national_code, parking_receipt_id) FROM stdin;
    public          postgres    false    235   ��       �          0    16898    parking_usage 
   TABLE DATA           U   COPY public.parking_usage (arrival_time, national_code, parking_city_id) FROM stdin;
    public          postgres    false    234   ��       �          0    16473    path 
   TABLE DATA           I   COPY public.path (path_name, transpot_network_name, path_id) FROM stdin;
    public          postgres    false    223   ˿       �          0    16423    payment_receipt 
   TABLE DATA           {   COPY public.payment_receipt (receipt_code, payable_amount, time_of_issue, citizen_national_code, service_used) FROM stdin;
    public          postgres    false    218   ��       �          0    16650    requests 
   TABLE DATA           =   COPY public.requests (national_id, type_service) FROM stdin;
    public          postgres    false    230   �       �          0    16629    services 
   TABLE DATA           0   COPY public.services (type_service) FROM stdin;
    public          postgres    false    228   /�       �          0    16635    services_usage 
   TABLE DATA           `   COPY public.services_usage (national_id, type_service, usage_date, amount_of_usage) FROM stdin;
    public          postgres    false    229   L�       �          0    16803    station 
   TABLE DATA           S   COPY public.station (station_id, station_name, x_location, y_location) FROM stdin;
    public          postgres    false    231   i�       �          0    16823    station_r_path 
   TABLE DATA           =   COPY public.station_r_path (path_id, station_id) FROM stdin;
    public          postgres    false    232   ��       �          0    16838    station_sequence 
   TABLE DATA           i   COPY public.station_sequence (first_station_id, second_station_id, distance, period_of_time) FROM stdin;
    public          postgres    false    233   ��       �          0    16452    transport_network 
   TABLE DATA           V   COPY public.transport_network (transpot_network_name, cost_per_kilometer) FROM stdin;
    public          postgres    false    221   -�       �          0    16524    travel 
   TABLE DATA           ]   COPY public.travel (citizen_id, car_tag, origin_id, destination_id, travel_date) FROM stdin;
    public          postgres    false    224   T�       �          0    16429    travel_receipt 
   TABLE DATA           m   COPY public.travel_receipt (travel_code, start_time, end_time, citizen_id, car_tag, travel_date) FROM stdin;
    public          postgres    false    219   q�       �           0    0    citizen_visit_visit_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.citizen_visit_visit_id_seq', 1, false);
          public          postgres    false    238            �           2606    16462    car car_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (tag);
 6   ALTER TABLE ONLY public.car DROP CONSTRAINT car_pkey;
       public            postgres    false    222            �           2606    16412 $   citizen_account citizen_account_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.citizen_account
    ADD CONSTRAINT citizen_account_pkey PRIMARY KEY (citizen_id);
 N   ALTER TABLE ONLY public.citizen_account DROP CONSTRAINT citizen_account_pkey;
       public            postgres    false    217            �           2606    16407    citizen citizen_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.citizen
    ADD CONSTRAINT citizen_pkey PRIMARY KEY (national_code);
 >   ALTER TABLE ONLY public.citizen DROP CONSTRAINT citizen_pkey;
       public            postgres    false    216            �           2606    17147     citizen_visit citizen_visit_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.citizen_visit
    ADD CONSTRAINT citizen_visit_pkey PRIMARY KEY (visit_id);
 J   ALTER TABLE ONLY public.citizen_visit DROP CONSTRAINT citizen_visit_pkey;
       public            postgres    false    239            �           2606    16446 .   city_service_receipt city_service_receipt_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.city_service_receipt
    ADD CONSTRAINT city_service_receipt_pkey PRIMARY KEY (city_service_receipt_id);
 X   ALTER TABLE ONLY public.city_service_receipt DROP CONSTRAINT city_service_receipt_pkey;
       public            postgres    false    220            �           2606    17080 $   driving_citizen driving_citizen_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.driving_citizen
    ADD CONSTRAINT driving_citizen_pkey PRIMARY KEY (national_code);
 N   ALTER TABLE ONLY public.driving_citizen DROP CONSTRAINT driving_citizen_pkey;
       public            postgres    false    236            �           2606    17102    driving driving_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.driving
    ADD CONSTRAINT driving_pkey PRIMARY KEY (national_id);
 >   ALTER TABLE ONLY public.driving DROP CONSTRAINT driving_pkey;
       public            postgres    false    237            �           2606    16587    home_owner home_owner_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.home_owner
    ADD CONSTRAINT home_owner_pkey PRIMARY KEY (national_id);
 D   ALTER TABLE ONLY public.home_owner DROP CONSTRAINT home_owner_pkey;
       public            postgres    false    225            �           2606    16597    home home_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.home
    ADD CONSTRAINT home_pkey PRIMARY KEY (city_id);
 8   ALTER TABLE ONLY public.home DROP CONSTRAINT home_pkey;
       public            postgres    false    226            �           2606    16599    home location_h 
   CONSTRAINT     \   ALTER TABLE ONLY public.home
    ADD CONSTRAINT location_h UNIQUE (x_location, y_location);
 9   ALTER TABLE ONLY public.home DROP CONSTRAINT location_h;
       public            postgres    false    226    226            �           2606    16613    parking location_p 
   CONSTRAINT     _   ALTER TABLE ONLY public.parking
    ADD CONSTRAINT location_p UNIQUE (x_location, y_location);
 <   ALTER TABLE ONLY public.parking DROP CONSTRAINT location_p;
       public            postgres    false    227    227            �           2606    16611    parking parking_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.parking
    ADD CONSTRAINT parking_pkey PRIMARY KEY (city_id);
 >   ALTER TABLE ONLY public.parking DROP CONSTRAINT parking_pkey;
       public            postgres    false    227            �           2606    16922 $   parking_receipt parking_receipt_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.parking_receipt
    ADD CONSTRAINT parking_receipt_pkey PRIMARY KEY (parking_receipt_id);
 N   ALTER TABLE ONLY public.parking_receipt DROP CONSTRAINT parking_receipt_pkey;
       public            postgres    false    235            �           2606    16902     parking_usage parking_usage_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.parking_usage
    ADD CONSTRAINT parking_usage_pkey PRIMARY KEY (national_code, arrival_time);
 J   ALTER TABLE ONLY public.parking_usage DROP CONSTRAINT parking_usage_pkey;
       public            postgres    false    234    234            �           2606    16477    path path_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.path
    ADD CONSTRAINT path_pkey PRIMARY KEY (path_id);
 8   ALTER TABLE ONLY public.path DROP CONSTRAINT path_pkey;
       public            postgres    false    223            �           2606    16428 $   payment_receipt payment_receipt_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.payment_receipt
    ADD CONSTRAINT payment_receipt_pkey PRIMARY KEY (receipt_code);
 N   ALTER TABLE ONLY public.payment_receipt DROP CONSTRAINT payment_receipt_pkey;
       public            postgres    false    218            �           2606    16654    requests requests_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (national_id, type_service);
 @   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_pkey;
       public            postgres    false    230    230            �           2606    16634    services services_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (type_service);
 @   ALTER TABLE ONLY public.services DROP CONSTRAINT services_pkey;
       public            postgres    false    228            �           2606    16639 "   services_usage services_usage_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.services_usage
    ADD CONSTRAINT services_usage_pkey PRIMARY KEY (national_id, type_service);
 L   ALTER TABLE ONLY public.services_usage DROP CONSTRAINT services_usage_pkey;
       public            postgres    false    229    229            �           2606    16807    station station_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (station_id);
 >   ALTER TABLE ONLY public.station DROP CONSTRAINT station_pkey;
       public            postgres    false    231            �           2606    16827 "   station_r_path station_r_path_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.station_r_path
    ADD CONSTRAINT station_r_path_pkey PRIMARY KEY (path_id, station_id);
 L   ALTER TABLE ONLY public.station_r_path DROP CONSTRAINT station_r_path_pkey;
       public            postgres    false    232    232            �           2606    16842 &   station_sequence station_sequence_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.station_sequence
    ADD CONSTRAINT station_sequence_pkey PRIMARY KEY (first_station_id);
 P   ALTER TABLE ONLY public.station_sequence DROP CONSTRAINT station_sequence_pkey;
       public            postgres    false    233            �           2606    16844 7   station_sequence station_sequence_second_station_id_key 
   CONSTRAINT        ALTER TABLE ONLY public.station_sequence
    ADD CONSTRAINT station_sequence_second_station_id_key UNIQUE (second_station_id);
 a   ALTER TABLE ONLY public.station_sequence DROP CONSTRAINT station_sequence_second_station_id_key;
       public            postgres    false    233            �           2606    16809 )   station station_x_location_y_location_key 
   CONSTRAINT     v   ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_x_location_y_location_key UNIQUE (x_location, y_location);
 S   ALTER TABLE ONLY public.station DROP CONSTRAINT station_x_location_y_location_key;
       public            postgres    false    231    231            �           2606    16457 (   transport_network transport_network_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.transport_network
    ADD CONSTRAINT transport_network_pkey PRIMARY KEY (transpot_network_name);
 R   ALTER TABLE ONLY public.transport_network DROP CONSTRAINT transport_network_pkey;
       public            postgres    false    221            �           2606    17026    travel travel_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.travel
    ADD CONSTRAINT travel_pkey PRIMARY KEY (citizen_id, car_tag, travel_date);
 <   ALTER TABLE ONLY public.travel DROP CONSTRAINT travel_pkey;
       public            postgres    false    224    224    224            �           2606    16434 "   travel_receipt travel_receipt_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.travel_receipt
    ADD CONSTRAINT travel_receipt_pkey PRIMARY KEY (travel_code);
 L   ALTER TABLE ONLY public.travel_receipt DROP CONSTRAINT travel_receipt_pkey;
       public            postgres    false    219            �           2606    17149    citizen_visit unique_visit 
   CONSTRAINT     v   ALTER TABLE ONLY public.citizen_visit
    ADD CONSTRAINT unique_visit UNIQUE (national_code, station_id, visit_date);
 D   ALTER TABLE ONLY public.citizen_visit DROP CONSTRAINT unique_visit;
       public            postgres    false    239    239    239            �           2618    17186 
   v4 _RETURN    RULE     T  CREATE OR REPLACE VIEW public.v4 AS
 SELECT home.city_id,
    home.address,
    home.x_location,
    home.y_location,
    home.national_id
   FROM (public.home
     JOIN public.services_usage ON ((home.national_id = services_usage.national_id)))
  WHERE ((services_usage.usage_date >= (date_trunc('month'::text, (CURRENT_DATE)::timestamp with time zone) - '1 mon'::interval)) AND (services_usage.type_service = 'electricity'::bpchar))
  GROUP BY home.city_id, home.address, home.x_location
 HAVING (sum(services_usage.amount_of_usage) > (current_setting('my.vars.usage_amount'::text))::integer);
 �   CREATE OR REPLACE VIEW public.v4 AS
SELECT
    NULL::character(10) AS city_id,
    NULL::character varying(200) AS address,
    NULL::integer AS x_location,
    NULL::integer AS y_location,
    NULL::character(10) AS national_id;
       public          postgres    false    226    226    226    226    226    229    229    229    4825    229    243                       2606    16468    car car_car_owner_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_car_owner_fkey FOREIGN KEY (car_owner) REFERENCES public.citizen(national_code);
 @   ALTER TABLE ONLY public.car DROP CONSTRAINT car_car_owner_fkey;
       public          postgres    false    216    222    4805                       2606    16670    car car_name    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_name FOREIGN KEY (transpot_network_name) REFERENCES public.transport_network(transpot_network_name) ON UPDATE CASCADE ON DELETE SET NULL;
 6   ALTER TABLE ONLY public.car DROP CONSTRAINT car_name;
       public          postgres    false    222    221    4815            	           2606    16675    car car_owner    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_owner FOREIGN KEY (car_owner) REFERENCES public.citizen(national_code) ON UPDATE CASCADE ON DELETE SET NULL;
 7   ALTER TABLE ONLY public.car DROP CONSTRAINT car_owner;
       public          postgres    false    216    222    4805                       2606    16710    travel car_tag    FK CONSTRAINT     �   ALTER TABLE ONLY public.travel
    ADD CONSTRAINT car_tag FOREIGN KEY (car_tag) REFERENCES public.car(tag) ON UPDATE CASCADE ON DELETE SET NULL;
 8   ALTER TABLE ONLY public.travel DROP CONSTRAINT car_tag;
       public          postgres    false    224    4817    222            
           2606    16463 "   car car_transpot_network_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_transpot_network_name_fkey FOREIGN KEY (transpot_network_name) REFERENCES public.transport_network(transpot_network_name);
 L   ALTER TABLE ONLY public.car DROP CONSTRAINT car_transpot_network_name_fkey;
       public          postgres    false    4815    221    222                       2606    16705    travel cicizen_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.travel
    ADD CONSTRAINT cicizen_id FOREIGN KEY (citizen_id) REFERENCES public.citizen(national_code) ON UPDATE CASCADE ON DELETE SET NULL;
 ;   ALTER TABLE ONLY public.travel DROP CONSTRAINT cicizen_id;
       public          postgres    false    216    224    4805            �           2606    16413 /   citizen_account citizen_account_citizen_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.citizen_account
    ADD CONSTRAINT citizen_account_citizen_id_fkey FOREIGN KEY (citizen_id) REFERENCES public.citizen(national_code);
 Y   ALTER TABLE ONLY public.citizen_account DROP CONSTRAINT citizen_account_citizen_id_fkey;
       public          postgres    false    216    217    4805            �           2606    16418 (   citizen citizen_overseer_citizen_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.citizen
    ADD CONSTRAINT citizen_overseer_citizen_id_fkey FOREIGN KEY (overseer_citizen_id) REFERENCES public.citizen(national_code);
 R   ALTER TABLE ONLY public.citizen DROP CONSTRAINT citizen_overseer_citizen_id_fkey;
       public          postgres    false    216    4805    216            $           2606    17150 .   citizen_visit citizen_visit_national_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.citizen_visit
    ADD CONSTRAINT citizen_visit_national_code_fkey FOREIGN KEY (national_code) REFERENCES public.citizen(national_code);
 X   ALTER TABLE ONLY public.citizen_visit DROP CONSTRAINT citizen_visit_national_code_fkey;
       public          postgres    false    216    239    4805            %           2606    17155 +   citizen_visit citizen_visit_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.citizen_visit
    ADD CONSTRAINT citizen_visit_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.station(station_id);
 U   ALTER TABLE ONLY public.citizen_visit DROP CONSTRAINT citizen_visit_station_id_fkey;
       public          postgres    false    4839    231    239                       2606    16720 :   city_service_receipt city_service_receipt_national_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.city_service_receipt
    ADD CONSTRAINT city_service_receipt_national_id_fkey FOREIGN KEY (national_id) REFERENCES public.home_owner(national_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.city_service_receipt DROP CONSTRAINT city_service_receipt_national_id_fkey;
       public          postgres    false    220    225    4823                       2606    16715 ;   city_service_receipt city_service_receipt_type_service_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.city_service_receipt
    ADD CONSTRAINT city_service_receipt_type_service_fkey FOREIGN KEY (type_service) REFERENCES public.services(type_service) ON UPDATE CASCADE ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.city_service_receipt DROP CONSTRAINT city_service_receipt_type_service_fkey;
       public          postgres    false    220    4833    228                        2606    17160    driving_citizen cs    FK CONSTRAINT     x   ALTER TABLE ONLY public.driving_citizen
    ADD CONSTRAINT cs FOREIGN KEY (city_id) REFERENCES public.parking(city_id);
 <   ALTER TABLE ONLY public.driving_citizen DROP CONSTRAINT cs;
       public          postgres    false    4831    236    227                       2606    17049    travel destination_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.travel
    ADD CONSTRAINT destination_id FOREIGN KEY (destination_id) REFERENCES public.station(station_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.travel DROP CONSTRAINT destination_id;
       public          postgres    false    224    4839    231            "           2606    17108    driving driving_car_tag_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.driving
    ADD CONSTRAINT driving_car_tag_fkey FOREIGN KEY (car_tag) REFERENCES public.car(tag) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.driving DROP CONSTRAINT driving_car_tag_fkey;
       public          postgres    false    222    237    4817            !           2606    17081 2   driving_citizen driving_citizen_national_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.driving_citizen
    ADD CONSTRAINT driving_citizen_national_code_fkey FOREIGN KEY (national_code) REFERENCES public.citizen(national_code) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.driving_citizen DROP CONSTRAINT driving_citizen_national_code_fkey;
       public          postgres    false    216    4805    236            #           2606    17103     driving driving_national_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.driving
    ADD CONSTRAINT driving_national_id_fkey FOREIGN KEY (national_id) REFERENCES public.driving_citizen(national_code) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.driving DROP CONSTRAINT driving_national_id_fkey;
       public          postgres    false    237    4853    236                       2606    17027    travel_receipt foreign_keys    FK CONSTRAINT     �   ALTER TABLE ONLY public.travel_receipt
    ADD CONSTRAINT foreign_keys FOREIGN KEY (citizen_id, car_tag, travel_date) REFERENCES public.travel(citizen_id, car_tag, travel_date) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.travel_receipt DROP CONSTRAINT foreign_keys;
       public          postgres    false    224    4821    224    224    219    219    219                       2606    16725 (   city_service_receipt foreign_keys_second    FK CONSTRAINT     �   ALTER TABLE ONLY public.city_service_receipt
    ADD CONSTRAINT foreign_keys_second FOREIGN KEY (type_service, national_id) REFERENCES public.services_usage(type_service, national_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.city_service_receipt DROP CONSTRAINT foreign_keys_second;
       public          postgres    false    229    220    4835    229    220                       2606    16600    home home_national_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.home
    ADD CONSTRAINT home_national_id_fkey FOREIGN KEY (national_id) REFERENCES public.home_owner(national_id) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.home DROP CONSTRAINT home_national_id_fkey;
       public          postgres    false    226    4823    225                       2606    16588 &   home_owner home_owner_national_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.home_owner
    ADD CONSTRAINT home_owner_national_id_fkey FOREIGN KEY (national_id) REFERENCES public.citizen(national_code) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.home_owner DROP CONSTRAINT home_owner_national_id_fkey;
       public          postgres    false    225    4805    216                       2606    17044    travel origin_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.travel
    ADD CONSTRAINT origin_id FOREIGN KEY (origin_id) REFERENCES public.station(station_id) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.travel DROP CONSTRAINT origin_id;
       public          postgres    false    224    4839    231                       2606    16923 ?   parking_receipt parking_receipt_national_code_arrival_time_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.parking_receipt
    ADD CONSTRAINT parking_receipt_national_code_arrival_time_fkey FOREIGN KEY (national_code, arrival_time) REFERENCES public.parking_usage(national_code, arrival_time) ON UPDATE CASCADE ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.parking_receipt DROP CONSTRAINT parking_receipt_national_code_arrival_time_fkey;
       public          postgres    false    234    235    4849    234    235                       2606    16903 .   parking_usage parking_usage_national_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.parking_usage
    ADD CONSTRAINT parking_usage_national_code_fkey FOREIGN KEY (national_code) REFERENCES public.citizen(national_code) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.parking_usage DROP CONSTRAINT parking_usage_national_code_fkey;
       public          postgres    false    4805    234    216                       2606    16908 0   parking_usage parking_usage_parking_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.parking_usage
    ADD CONSTRAINT parking_usage_parking_city_id_fkey FOREIGN KEY (parking_city_id) REFERENCES public.parking(city_id) ON UPDATE CASCADE ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.parking_usage DROP CONSTRAINT parking_usage_parking_city_id_fkey;
       public          postgres    false    234    227    4831                       2606    16680    path path_transport    FK CONSTRAINT     �   ALTER TABLE ONLY public.path
    ADD CONSTRAINT path_transport FOREIGN KEY (transpot_network_name) REFERENCES public.transport_network(transpot_network_name) ON UPDATE CASCADE ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.path DROP CONSTRAINT path_transport;
       public          postgres    false    223    4815    221                       2606    16478 $   path path_transpot_network_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.path
    ADD CONSTRAINT path_transpot_network_name_fkey FOREIGN KEY (transpot_network_name) REFERENCES public.transport_network(transpot_network_name);
 N   ALTER TABLE ONLY public.path DROP CONSTRAINT path_transpot_network_name_fkey;
       public          postgres    false    4815    221    223            �           2606    16447 :   payment_receipt payment_receipt_citizen_national_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment_receipt
    ADD CONSTRAINT payment_receipt_citizen_national_code_fkey FOREIGN KEY (citizen_national_code) REFERENCES public.citizen(national_code);
 d   ALTER TABLE ONLY public.payment_receipt DROP CONSTRAINT payment_receipt_citizen_national_code_fkey;
       public          postgres    false    218    216    4805                       2606    16655 "   requests requests_national_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_national_id_fkey FOREIGN KEY (national_id) REFERENCES public.home_owner(national_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_national_id_fkey;
       public          postgres    false    225    230    4823                       2606    16660 #   requests requests_type_service_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_type_service_fkey FOREIGN KEY (type_service) REFERENCES public.services(type_service) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_type_service_fkey;
       public          postgres    false    228    230    4833                       2606    16640 .   services_usage services_usage_national_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.services_usage
    ADD CONSTRAINT services_usage_national_id_fkey FOREIGN KEY (national_id) REFERENCES public.home_owner(national_id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.services_usage DROP CONSTRAINT services_usage_national_id_fkey;
       public          postgres    false    225    229    4823                       2606    16645 /   services_usage services_usage_type_service_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.services_usage
    ADD CONSTRAINT services_usage_type_service_fkey FOREIGN KEY (type_service) REFERENCES public.services(type_service) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.services_usage DROP CONSTRAINT services_usage_type_service_fkey;
       public          postgres    false    229    4833    228                       2606    16828 *   station_r_path station_r_path_path_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.station_r_path
    ADD CONSTRAINT station_r_path_path_id_fkey FOREIGN KEY (path_id) REFERENCES public.path(path_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.station_r_path DROP CONSTRAINT station_r_path_path_id_fkey;
       public          postgres    false    223    232    4819                       2606    16833 -   station_r_path station_r_path_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.station_r_path
    ADD CONSTRAINT station_r_path_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.station(station_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.station_r_path DROP CONSTRAINT station_r_path_station_id_fkey;
       public          postgres    false    4839    231    232                       2606    16845 7   station_sequence station_sequence_first_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.station_sequence
    ADD CONSTRAINT station_sequence_first_station_id_fkey FOREIGN KEY (first_station_id) REFERENCES public.station(station_id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.station_sequence DROP CONSTRAINT station_sequence_first_station_id_fkey;
       public          postgres    false    4839    233    231                       2606    16850 8   station_sequence station_sequence_second_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.station_sequence
    ADD CONSTRAINT station_sequence_second_station_id_fkey FOREIGN KEY (second_station_id) REFERENCES public.station(station_id) ON UPDATE CASCADE ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.station_sequence DROP CONSTRAINT station_sequence_second_station_id_fkey;
       public          postgres    false    231    233    4839                       2606    16534    travel travel_car_tag_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.travel
    ADD CONSTRAINT travel_car_tag_fkey FOREIGN KEY (car_tag) REFERENCES public.car(tag);
 D   ALTER TABLE ONLY public.travel DROP CONSTRAINT travel_car_tag_fkey;
       public          postgres    false    222    4817    224                       2606    16529    travel travel_citizen_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.travel
    ADD CONSTRAINT travel_citizen_id_fkey FOREIGN KEY (citizen_id) REFERENCES public.citizen(national_code);
 G   ALTER TABLE ONLY public.travel DROP CONSTRAINT travel_citizen_id_fkey;
       public          postgres    false    224    4805    216                       2606    16861 *   travel_receipt travel_receipt_car_tag_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.travel_receipt
    ADD CONSTRAINT travel_receipt_car_tag_fkey FOREIGN KEY (car_tag) REFERENCES public.car(tag) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.travel_receipt DROP CONSTRAINT travel_receipt_car_tag_fkey;
       public          postgres    false    219    4817    222                       2606    16856 -   travel_receipt travel_receipt_citizen_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.travel_receipt
    ADD CONSTRAINT travel_receipt_citizen_id_fkey FOREIGN KEY (citizen_id) REFERENCES public.citizen(national_code) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.travel_receipt DROP CONSTRAINT travel_receipt_citizen_id_fkey;
       public          postgres    false    216    219    4805            �           2606    16578    citizen_account x    FK CONSTRAINT     �   ALTER TABLE ONLY public.citizen_account
    ADD CONSTRAINT x FOREIGN KEY (citizen_id) REFERENCES public.citizen(national_code) ON UPDATE CASCADE ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.citizen_account DROP CONSTRAINT x;
       public          postgres    false    4805    216    217                        2606    16665    payment_receipt y    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment_receipt
    ADD CONSTRAINT y FOREIGN KEY (citizen_national_code) REFERENCES public.citizen(national_code) ON UPDATE CASCADE ON DELETE SET NULL;
 ;   ALTER TABLE ONLY public.payment_receipt DROP CONSTRAINT y;
       public          postgres    false    218    4805    216            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   )   x�3T��ĜLNC+c+N#C 	b�8�+F��� ��S      �      x������ � �      �      x������ � �      �      x�K���,I���442����� 2�G      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   <   x�3426153�PP�t�440 a.C��%PЉ��E� (�4��]��`�=... ��f      �   '   x�342�4426153�PP�2Dp-Q��\s 7F��� p�
�      �   1   x�3426153�PP�4�0-ALNS.d� �4B�3G�Y��b���� ���      �      x�+I���4400������  �3      �      x������ � �      �      x������ � �     