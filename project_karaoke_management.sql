--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-12-01 14:36:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 16488)
-- Name: customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone_number character varying(20) NOT NULL,
    address character varying(255),
    created_at character varying,
    updated_at character varying
);


--
-- TOC entry 201 (class 1259 OID 16486)
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 201
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- TOC entry 208 (class 1259 OID 24695)
-- Name: menu; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.menu (
    menu_id integer NOT NULL,
    menu_name character varying NOT NULL,
    menu_type character varying NOT NULL,
    menu_price bigint NOT NULL,
    menu_unit character varying NOT NULL,
    menu_status smallint DEFAULT 1 NOT NULL,
    created_at character varying DEFAULT now(),
    updated_at character varying DEFAULT now()
);


--
-- TOC entry 207 (class 1259 OID 24693)
-- Name: food_bar_foodbar_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.food_bar_foodbar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 207
-- Name: food_bar_foodbar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.food_bar_foodbar_id_seq OWNED BY public.menu.menu_id;


--
-- TOC entry 210 (class 1259 OID 32903)
-- Name: receipt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.receipt (
    receipt_id integer NOT NULL,
    room_id integer NOT NULL,
    user_id integer NOT NULL,
    customer_id integer,
    created_at character varying,
    updated_at character varying
);


--
-- TOC entry 209 (class 1259 OID 32901)
-- Name: receipt_receipt_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.receipt_receipt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 209
-- Name: receipt_receipt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.receipt_receipt_id_seq OWNED BY public.receipt.receipt_id;


--
-- TOC entry 199 (class 1259 OID 16435)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    role_name character varying NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 16433)
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 198
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.role.role_id;


--
-- TOC entry 206 (class 1259 OID 16514)
-- Name: room; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.room (
    room_id integer NOT NULL,
    room_name character varying NOT NULL,
    roomtype_id integer NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    active smallint DEFAULT 0 NOT NULL,
    created_at character varying,
    updated_at character varying
);


--
-- TOC entry 205 (class 1259 OID 16512)
-- Name: room_room_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.room_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 205
-- Name: room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.room_room_id_seq OWNED BY public.room.room_id;


--
-- TOC entry 204 (class 1259 OID 16501)
-- Name: room_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.room_type (
    roomtype_id integer NOT NULL,
    roomtype_name character varying NOT NULL,
    roomtype_price bigint,
    created_at character varying,
    updated_at character varying
);


--
-- TOC entry 203 (class 1259 OID 16499)
-- Name: room_type_roomtype_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.room_type_roomtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 203
-- Name: room_type_roomtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.room_type_roomtype_id_seq OWNED BY public.room_type.roomtype_id;


--
-- TOC entry 197 (class 1259 OID 16396)
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    created_at character varying,
    updated_at character varying,
    display_name character varying NOT NULL,
    phone character varying,
    address character varying,
    role_id integer
);


--
-- TOC entry 200 (class 1259 OID 16446)
-- Name: user_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_role (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 16394)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public."user".id;


--
-- TOC entry 2734 (class 2604 OID 16491)
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- TOC entry 2739 (class 2604 OID 24698)
-- Name: menu menu_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu ALTER COLUMN menu_id SET DEFAULT nextval('public.food_bar_foodbar_id_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 32906)
-- Name: receipt receipt_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receipt ALTER COLUMN receipt_id SET DEFAULT nextval('public.receipt_receipt_id_seq'::regclass);


--
-- TOC entry 2733 (class 2604 OID 16438)
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 16517)
-- Name: room room_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room ALTER COLUMN room_id SET DEFAULT nextval('public.room_room_id_seq'::regclass);


--
-- TOC entry 2735 (class 2604 OID 16504)
-- Name: room_type roomtype_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type ALTER COLUMN roomtype_id SET DEFAULT nextval('public.room_type_roomtype_id_seq'::regclass);


--
-- TOC entry 2732 (class 2604 OID 16399)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2898 (class 0 OID 16488)
-- Dependencies: 202
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.customer VALUES (1, 'Nguyên Văn A', '123456789', 'abc', NULL, NULL);
INSERT INTO public.customer VALUES (2, 'Võ Văn B', '123456789', 'abc123', NULL, NULL);
INSERT INTO public.customer VALUES (3, 'Nguyễn Thị C', '123456789', 'abc123', NULL, NULL);


--
-- TOC entry 2904 (class 0 OID 24695)
-- Dependencies: 208
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.menu VALUES (1, 'Cafe đá/nóng', 'Nước giải khát', 41000, 'ly', 1, '2019-10-19 14:07:31.485905+07', '2019-10-19 14:07:31.485905+07');
INSERT INTO public.menu VALUES (2, 'Cafe sữa đá/nóng', 'Nước giải khát', 60000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (3, 'Cafe Bailey', 'Nước giải khát', 60000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (4, 'Trà lipton đá/nóng', 'Nước giải khát', 60000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (5, 'Trà lipton sữa đá/nóng', 'Nước giải khát', 60000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (6, 'Trà gừng đá/nóng', 'Nước giải khát', 60000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (7, 'Trà bông cúc đá/nóng', 'Nước giải khát', 60000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (8, 'Bình trà gừng', 'Nước giải khát', 150000, 'bình', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (9, 'Bình trà bông cúc', 'Nước giải khát', 150000, 'bình', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (10, 'Bình trà lipton', 'Nước giải khát', 150000, 'bình', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (11, 'Chanh đá/nóng', 'Nước giải khát', 60000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (12, 'Chanh muối đá/nóng', 'Nước giải khát', 60000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (13, 'Chanh muối đá/nóng', 'Nước giải khát', 60000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (14, 'Soda chanh', 'Nước giải khát', 50000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (15, 'Sữa tươi', 'Nước giải khát', 60000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (16, '7UP', 'Nước giải khát', 60000, 'lon', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (17, 'Redbull', 'Nước giải khát', 50000, 'lon', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (18, 'Sting', 'Nước giải khát', 39000, 'chai', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (19, 'Coca', 'Nước giải khát', 39000, 'lon', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (20, 'Suối Kingdom', 'Nước giải khát', 30000, 'chai', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (21, 'Lavie', 'Nước giải khát', 30000, 'chai', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (22, 'Aquafina', 'Nước giải khát', 30000, 'chai', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (23, 'Trái cây tổng hợp', 'Trái cây', 250000, 'dĩa', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (24, 'Trái cây bưởi', 'Trái cây', 300000, 'dĩa', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (25, 'Rong biển', 'Món khô', 40000, 'phần', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (26, 'Khô bò', 'Món khô', 40000, 'phần', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (27, 'Khô gà', 'Món khô', 40000, 'phần', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (28, 'Phô mai', 'Món khô', 40000, 'phần', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (29, 'Hạt điều', 'Món khô', 40000, 'phần', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (30, 'Hạt dẻ', 'Món khô', 40000, 'phần', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (31, 'Macca', 'Món khô', 40000, 'phần', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (32, 'Việt quất', 'Sinh tố', 85000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (33, 'Phúc bồ tử', 'Sinh tố', 85000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (34, 'Đào', 'Sinh tố', 85000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (35, 'Chanh dây', 'Sinh tố', 85000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (36, 'Kiwi', 'Sinh tố', 85000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (37, 'Xoài', 'Sinh tố', 85000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');
INSERT INTO public.menu VALUES (38, 'Cam - nha đam', 'Sinh tố', 85000, 'ly', 1, '2019-10-19 14:23:05.255342+07', '2019-10-19 14:23:05.255342+07');


--
-- TOC entry 2906 (class 0 OID 32903)
-- Dependencies: 210
-- Data for Name: receipt; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2895 (class 0 OID 16435)
-- Dependencies: 199
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.role VALUES (2, 'staff');
INSERT INTO public.role VALUES (1, 'admin');


--
-- TOC entry 2902 (class 0 OID 16514)
-- Dependencies: 206
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.room VALUES (3, 'P.103', 2, 1, 1, NULL, NULL);
INSERT INTO public.room VALUES (4, 'P.201', 1, 1, 0, NULL, NULL);
INSERT INTO public.room VALUES (2, 'P.102', 1, 1, 0, NULL, NULL);
INSERT INTO public.room VALUES (5, 'P.202', 1, 1, 0, NULL, NULL);
INSERT INTO public.room VALUES (6, 'P.203', 2, 1, 1, NULL, NULL);
INSERT INTO public.room VALUES (1, 'P.101', 1, 0, 0, NULL, NULL);
INSERT INTO public.room VALUES (7, 'P.104', 1, 0, 0, NULL, NULL);
INSERT INTO public.room VALUES (8, 'test', 1, 1, 0, '04:36:43 27-11-2019', '04:36:43 27-11-2019');


--
-- TOC entry 2900 (class 0 OID 16501)
-- Dependencies: 204
-- Data for Name: room_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.room_type VALUES (1, 'Thường', 120000, NULL, NULL);
INSERT INTO public.room_type VALUES (2, 'VIP', 200000, NULL, NULL);
INSERT INTO public.room_type VALUES (4, 'test', 120000, '01:39:22 27-11-2019', '04:02:22 29-11-2019');


--
-- TOC entry 2893 (class 0 OID 16396)
-- Dependencies: 197
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."user" VALUES (2, 'user', '$2a$10$D0SsJDd3EnVPwM0uzXKTW.uhCkE/PUqR0nyGRrP2X42krivLweBc.', NULL, NULL, 'User', NULL, NULL, 2);
INSERT INTO public."user" VALUES (1, 'admin', '$2a$10$nMbzkpMobkb7IYktgN/5ouE/n1At8g/637ORn3X6pqmCvvFD9rJpG', NULL, NULL, 'Admin', NULL, NULL, 1);
INSERT INTO public."user" VALUES (18, 'test', '$2a$10$TeUqRxpaIYK1SaWBCUQyQu4SJXQcR.pco2NmEe.0CDdx21o7CZVN.', '03:53:25 29-11-2019', '03:53:45 29-11-2019', 'Test', NULL, NULL, 1);


--
-- TOC entry 2896 (class 0 OID 16446)
-- Dependencies: 200
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.user_role VALUES (1, 1);
INSERT INTO public.user_role VALUES (1, 2);
INSERT INTO public.user_role VALUES (2, 2);
INSERT INTO public.user_role VALUES (2, 7);
INSERT INTO public.user_role VALUES (2, 6);
INSERT INTO public.user_role VALUES (2, 8);
INSERT INTO public.user_role VALUES (2, 10);
INSERT INTO public.user_role VALUES (2, 12);
INSERT INTO public.user_role VALUES (2, 16);
INSERT INTO public.user_role VALUES (2, 17);


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 201
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 4, true);


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 207
-- Name: food_bar_foodbar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.food_bar_foodbar_id_seq', 38, true);


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 209
-- Name: receipt_receipt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.receipt_receipt_id_seq', 1, false);


--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 198
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 3, true);


--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 205
-- Name: room_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.room_room_id_seq', 8, true);


--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 203
-- Name: room_type_roomtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.room_type_roomtype_id_seq', 6, true);


--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 18, true);


--
-- TOC entry 2753 (class 2606 OID 16498)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 2761 (class 2606 OID 24705)
-- Name: menu food_bar_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT food_bar_pkey PRIMARY KEY (menu_id);


--
-- TOC entry 2745 (class 2606 OID 16406)
-- Name: user pr_id_users; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT pr_id_users PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32911)
-- Name: receipt receipt_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receipt
    ADD CONSTRAINT receipt_pkey PRIMARY KEY (receipt_id);


--
-- TOC entry 2751 (class 2606 OID 16450)
-- Name: user_role role_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT role_user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2749 (class 2606 OID 16445)
-- Name: role roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- TOC entry 2757 (class 2606 OID 16524)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);


--
-- TOC entry 2759 (class 2606 OID 16531)
-- Name: room room_room_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_room_name_key UNIQUE (room_name);


--
-- TOC entry 2755 (class 2606 OID 16511)
-- Name: room_type room_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type
    ADD CONSTRAINT room_type_pkey PRIMARY KEY (roomtype_id);


--
-- TOC entry 2747 (class 2606 OID 16424)
-- Name: user u_id_users; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT u_id_users UNIQUE (username);


--
-- TOC entry 2766 (class 2606 OID 16466)
-- Name: user_role fk_id_roles; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fk_id_roles FOREIGN KEY (user_id) REFERENCES public.role(role_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2765 (class 2606 OID 16461)
-- Name: user_role fk_id_users; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fk_id_users FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2770 (class 2606 OID 32922)
-- Name: receipt receipt_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receipt
    ADD CONSTRAINT receipt_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2768 (class 2606 OID 32912)
-- Name: receipt receipt_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receipt
    ADD CONSTRAINT receipt_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.room(room_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2769 (class 2606 OID 32917)
-- Name: receipt receipt_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receipt
    ADD CONSTRAINT receipt_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2767 (class 2606 OID 32896)
-- Name: room room_roomtype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_roomtype_id_fkey FOREIGN KEY (roomtype_id) REFERENCES public.room_type(roomtype_id) NOT VALID;


--
-- TOC entry 2764 (class 2606 OID 32891)
-- Name: user user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(role_id) NOT VALID;


-- Completed on 2019-12-01 14:36:55

--
-- PostgreSQL database dump complete
--

