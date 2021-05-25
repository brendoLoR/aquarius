--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-25 11:37:03

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 25567)
-- Name: clientes; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome_cliente character varying(80) NOT NULL,
    telefone character varying(20) DEFAULT '(xx) xxxxx-xxxx'::character varying NOT NULL,
    endereco character varying(150),
    email character varying(100)
);


ALTER TABLE public.clientes OWNER TO system;

--
-- TOC entry 201 (class 1259 OID 25571)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO system;

--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 201
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 202 (class 1259 OID 25573)
-- Name: imagem_produto; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.imagem_produto (
    id integer NOT NULL,
    imagem_path character varying(100)
);


ALTER TABLE public.imagem_produto OWNER TO system;

--
-- TOC entry 203 (class 1259 OID 25576)
-- Name: imagem_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public.imagem_produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imagem_produto_id_seq OWNER TO system;

--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 203
-- Name: imagem_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.imagem_produto_id_seq OWNED BY public.imagem_produto.id;


--
-- TOC entry 204 (class 1259 OID 25578)
-- Name: produto; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    nome_produto character varying(60) DEFAULT 'produto sem nome'::character varying NOT NULL,
    preco real DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.produto OWNER TO system;

--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE produto; Type: COMMENT; Schema: public; Owner: system
--

COMMENT ON TABLE public.produto IS 'item a ser usado em uma venda';


--
-- TOC entry 205 (class 1259 OID 25583)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public.produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produto_id_seq OWNER TO system;

--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 205
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 206 (class 1259 OID 25585)
-- Name: system_access_log; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_access_log (
    id integer NOT NULL,
    sessionid text,
    login text,
    login_time timestamp without time zone,
    login_year character varying(4),
    login_month character varying(2),
    login_day character varying(2),
    logout_time timestamp without time zone,
    impersonated character(1),
    access_ip character varying(45)
);


ALTER TABLE public.system_access_log OWNER TO system;

--
-- TOC entry 207 (class 1259 OID 25591)
-- Name: system_change_log; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_change_log (
    id integer NOT NULL,
    logdate timestamp without time zone,
    login text,
    tablename text,
    primarykey text,
    pkvalue text,
    operation text,
    columnname text,
    oldvalue text,
    newvalue text,
    access_ip text,
    transaction_id text,
    log_trace text,
    session_id text,
    class_name text,
    php_sapi text,
    log_year character varying(4),
    log_month character varying(2),
    log_day character varying(2)
);


ALTER TABLE public.system_change_log OWNER TO system;

--
-- TOC entry 208 (class 1259 OID 25597)
-- Name: system_document; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_document (
    id integer NOT NULL,
    system_user_id integer,
    title text,
    description text,
    category_id integer,
    submission_date date,
    archive_date date,
    filename text
);


ALTER TABLE public.system_document OWNER TO system;

--
-- TOC entry 209 (class 1259 OID 25603)
-- Name: system_document_category; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_document_category (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.system_document_category OWNER TO system;

--
-- TOC entry 210 (class 1259 OID 25609)
-- Name: system_document_group; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_document_group (
    id integer NOT NULL,
    document_id integer,
    system_group_id integer
);


ALTER TABLE public.system_document_group OWNER TO system;

--
-- TOC entry 211 (class 1259 OID 25612)
-- Name: system_document_user; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_document_user (
    id integer NOT NULL,
    document_id integer,
    system_user_id integer
);


ALTER TABLE public.system_document_user OWNER TO system;

--
-- TOC entry 212 (class 1259 OID 25615)
-- Name: system_group; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_group (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.system_group OWNER TO system;

--
-- TOC entry 213 (class 1259 OID 25618)
-- Name: system_group_program; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_group_program (
    id integer NOT NULL,
    system_group_id integer,
    system_program_id integer
);


ALTER TABLE public.system_group_program OWNER TO system;

--
-- TOC entry 214 (class 1259 OID 25621)
-- Name: system_message; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_message (
    id integer NOT NULL,
    system_user_id integer,
    system_user_to_id integer,
    subject text,
    message text,
    dt_message text,
    checked character(1)
);


ALTER TABLE public.system_message OWNER TO system;

--
-- TOC entry 215 (class 1259 OID 25627)
-- Name: system_notification; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_notification (
    id integer NOT NULL,
    system_user_id integer,
    system_user_to_id integer,
    subject text,
    message text,
    dt_message text,
    action_url text,
    action_label text,
    icon text,
    checked character(1)
);


ALTER TABLE public.system_notification OWNER TO system;

--
-- TOC entry 216 (class 1259 OID 25633)
-- Name: system_preference; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_preference (
    id text,
    value text
);


ALTER TABLE public.system_preference OWNER TO system;

--
-- TOC entry 217 (class 1259 OID 25639)
-- Name: system_program; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_program (
    id integer NOT NULL,
    name character varying(100),
    controller character varying(100)
);


ALTER TABLE public.system_program OWNER TO system;

--
-- TOC entry 218 (class 1259 OID 25642)
-- Name: system_request_log; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_request_log (
    id integer NOT NULL,
    endpoint text,
    logdate text,
    log_year character varying(4),
    log_month character varying(2),
    log_day character varying(2),
    session_id text,
    login text,
    access_ip text,
    class_name text,
    http_host text,
    server_port text,
    request_uri text,
    request_method text,
    query_string text,
    request_headers text,
    request_body text,
    request_duration integer
);


ALTER TABLE public.system_request_log OWNER TO system;

--
-- TOC entry 219 (class 1259 OID 25648)
-- Name: system_sql_log; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_sql_log (
    id integer NOT NULL,
    logdate timestamp without time zone,
    login text,
    database_name text,
    sql_command text,
    statement_type text,
    access_ip character varying(45),
    transaction_id text,
    log_trace text,
    session_id text,
    class_name text,
    php_sapi text,
    request_id text,
    log_year character varying(4),
    log_month character varying(2),
    log_day character varying(2)
);


ALTER TABLE public.system_sql_log OWNER TO system;

--
-- TOC entry 220 (class 1259 OID 25654)
-- Name: system_unit; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_unit (
    id integer NOT NULL,
    name character varying(100),
    connection_name character varying(100)
);


ALTER TABLE public.system_unit OWNER TO system;

--
-- TOC entry 221 (class 1259 OID 25657)
-- Name: system_user; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_user (
    id integer NOT NULL,
    name character varying(100),
    login character varying(100),
    password character varying(100),
    email character varying(100),
    frontpage_id integer,
    system_unit_id integer,
    active character(1)
);


ALTER TABLE public.system_user OWNER TO system;

--
-- TOC entry 222 (class 1259 OID 25660)
-- Name: system_user_group; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_user_group (
    id integer NOT NULL,
    system_user_id integer,
    system_group_id integer
);


ALTER TABLE public.system_user_group OWNER TO system;

--
-- TOC entry 223 (class 1259 OID 25663)
-- Name: system_user_program; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_user_program (
    id integer NOT NULL,
    system_user_id integer,
    system_program_id integer
);


ALTER TABLE public.system_user_program OWNER TO system;

--
-- TOC entry 224 (class 1259 OID 25666)
-- Name: system_user_unit; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_user_unit (
    id integer NOT NULL,
    system_user_id integer,
    system_unit_id integer
);


ALTER TABLE public.system_user_unit OWNER TO system;

--
-- TOC entry 225 (class 1259 OID 25669)
-- Name: tamanho; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.tamanho (
    id integer NOT NULL,
    tamanho character varying(3) DEFAULT 'XXX'::character varying NOT NULL
);


ALTER TABLE public.tamanho OWNER TO system;

--
-- TOC entry 226 (class 1259 OID 25673)
-- Name: tamanho_id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public.tamanho_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tamanho_id_seq OWNER TO system;

--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 226
-- Name: tamanho_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.tamanho_id_seq OWNED BY public.tamanho.id;


--
-- TOC entry 227 (class 1259 OID 25675)
-- Name: venda_produto; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.venda_produto (
    id integer NOT NULL,
    id_venda bigint DEFAULT 0 NOT NULL,
    id_produto bigint DEFAULT 0 NOT NULL,
    id_tamanho bigint DEFAULT 0 NOT NULL,
    quantidade integer DEFAULT 0 NOT NULL,
    observacao_produto text,
    desconto real,
    total_item double precision,
    imagem_path character varying(100)
);


ALTER TABLE public.venda_produto OWNER TO system;

--
-- TOC entry 228 (class 1259 OID 25685)
-- Name: venda_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public.venda_produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venda_produto_id_seq OWNER TO system;

--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 228
-- Name: venda_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.venda_produto_id_seq OWNED BY public.venda_produto.id;


--
-- TOC entry 229 (class 1259 OID 25687)
-- Name: vendas; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.vendas (
    id integer NOT NULL,
    data_venda timestamp without time zone NOT NULL,
    id_cliente bigint NOT NULL,
    data_entrega_previsto date NOT NULL,
    data_entrega_real date,
    observacao text,
    id_vendedor bigint NOT NULL,
    fase_producao integer NOT NULL,
    valor_pago double precision
);


ALTER TABLE public.vendas OWNER TO system;

--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN vendas.fase_producao; Type: COMMENT; Schema: public; Owner: system
--

COMMENT ON COLUMN public.vendas.fase_producao IS 'a fase será incrementada no decorrer da produção da camiseta';


--
-- TOC entry 230 (class 1259 OID 25693)
-- Name: vendas_id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public.vendas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendas_id_seq OWNER TO system;

--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 230
-- Name: vendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.vendas_id_seq OWNED BY public.vendas.id;


--
-- TOC entry 2968 (class 2604 OID 25695)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 2969 (class 2604 OID 25696)
-- Name: imagem_produto id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.imagem_produto ALTER COLUMN id SET DEFAULT nextval('public.imagem_produto_id_seq'::regclass);


--
-- TOC entry 2972 (class 2604 OID 25697)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 2974 (class 2604 OID 25698)
-- Name: tamanho id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.tamanho ALTER COLUMN id SET DEFAULT nextval('public.tamanho_id_seq'::regclass);


--
-- TOC entry 2979 (class 2604 OID 25699)
-- Name: venda_produto id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto ALTER COLUMN id SET DEFAULT nextval('public.venda_produto_id_seq'::regclass);


--
-- TOC entry 2980 (class 2604 OID 25700)
-- Name: vendas id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas ALTER COLUMN id SET DEFAULT nextval('public.vendas_id_seq'::regclass);


--
-- TOC entry 3184 (class 0 OID 25567)
-- Dependencies: 200
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.clientes VALUES (1, 'BRENDO JACKSON LEITE DA SILVA', '84 99809-3102', NULL, 'brendoja@hotmail.com');


--
-- TOC entry 3186 (class 0 OID 25573)
-- Dependencies: 202
-- Data for Name: imagem_produto; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.imagem_produto VALUES (1, NULL);
INSERT INTO public.imagem_produto VALUES (2, NULL);


--
-- TOC entry 3188 (class 0 OID 25578)
-- Dependencies: 204
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.produto VALUES (1, 'Camisa Basica', 20);
INSERT INTO public.produto VALUES (9, 'Camisa ciclismo M L zíper 15cm IND', 85);
INSERT INTO public.produto VALUES (2, 'Camisa ciclismo M C zíper 15cm IND', 75);


--
-- TOC entry 3190 (class 0 OID 25585)
-- Dependencies: 206
-- Data for Name: system_access_log; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_access_log VALUES (1, 'lp7s2etrfdenp6843njks56hv3', 'admin', '2021-05-18 11:25:31', '2021', '05', '18', '2021-05-18 22:19:16', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (3, '4dbjq3mdd8kndnnaflenpljs5e', 'Ana', '2021-05-18 23:19:45', '2021', '05', '18', NULL, 'N', '192.168.1.12');
INSERT INTO public.system_access_log VALUES (2, 'gnigc8e8n0hm8tut34bqgjcsdc', 'Ana', '2021-05-18 22:19:33', '2021', '05', '18', '2021-05-19 00:06:54', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (4, 't75enj1s3kasffoj7jslb9vnnm', 'admin', '2021-05-19 00:07:00', '2021', '05', '19', '2021-05-19 00:08:45', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (6, 'titm09lgf1ju3nvap0uc1rr1bu', 'Ana', '2021-05-20 06:18:25', '2021', '05', '20', NULL, 'N', '192.168.1.12');
INSERT INTO public.system_access_log VALUES (7, '2a31nh84e4eachk6u1ck07j9tt', 'Ana', '2021-05-20 18:44:14', '2021', '05', '20', NULL, 'N', '192.168.1.18');
INSERT INTO public.system_access_log VALUES (5, 'lhcf933mdco7v4prkmf67f0m2g', 'admin', '2021-05-19 18:43:25', '2021', '05', '19', '2021-05-22 23:51:44', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (8, '6vgji9lf7n48h6b7651burcr79', 'admin', '2021-05-22 23:51:52', '2021', '05', '22', NULL, 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (9, 'q09j273irmri61sb584invt8pp', 'admin', '2021-05-25 11:17:30', '2021', '05', '25', NULL, 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (10, 'jn7cifc1n00ms3cnsp7533e7cq', 'admin', '2021-05-25 11:22:50', '2021', '05', '25', NULL, 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (11, 'ld05n0bsoukai3d9jttorcvgqq', 'admin', '2021-05-25 11:23:26', '2021', '05', '25', NULL, 'N', '127.0.0.1');


--
-- TOC entry 3191 (class 0 OID 25591)
-- Dependencies: 207
-- Data for Name: system_change_log; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3192 (class 0 OID 25597)
-- Dependencies: 208
-- Data for Name: system_document; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3193 (class 0 OID 25603)
-- Dependencies: 209
-- Data for Name: system_document_category; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_document_category VALUES (1, 'Documentação');


--
-- TOC entry 3194 (class 0 OID 25609)
-- Dependencies: 210
-- Data for Name: system_document_group; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3195 (class 0 OID 25612)
-- Dependencies: 211
-- Data for Name: system_document_user; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3196 (class 0 OID 25615)
-- Dependencies: 212
-- Data for Name: system_group; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_group VALUES (1, 'Admin');
INSERT INTO public.system_group VALUES (2, 'Standard');


--
-- TOC entry 3197 (class 0 OID 25618)
-- Dependencies: 213
-- Data for Name: system_group_program; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_group_program VALUES (1, 1, 1);
INSERT INTO public.system_group_program VALUES (2, 1, 2);
INSERT INTO public.system_group_program VALUES (3, 1, 3);
INSERT INTO public.system_group_program VALUES (4, 1, 4);
INSERT INTO public.system_group_program VALUES (5, 1, 5);
INSERT INTO public.system_group_program VALUES (6, 1, 6);
INSERT INTO public.system_group_program VALUES (7, 1, 8);
INSERT INTO public.system_group_program VALUES (8, 1, 9);
INSERT INTO public.system_group_program VALUES (9, 1, 11);
INSERT INTO public.system_group_program VALUES (10, 1, 14);
INSERT INTO public.system_group_program VALUES (11, 1, 15);
INSERT INTO public.system_group_program VALUES (12, 2, 10);
INSERT INTO public.system_group_program VALUES (13, 2, 12);
INSERT INTO public.system_group_program VALUES (14, 2, 13);
INSERT INTO public.system_group_program VALUES (15, 2, 16);
INSERT INTO public.system_group_program VALUES (16, 2, 17);
INSERT INTO public.system_group_program VALUES (17, 2, 18);
INSERT INTO public.system_group_program VALUES (18, 2, 19);
INSERT INTO public.system_group_program VALUES (19, 2, 20);
INSERT INTO public.system_group_program VALUES (20, 1, 21);
INSERT INTO public.system_group_program VALUES (21, 2, 22);
INSERT INTO public.system_group_program VALUES (22, 2, 23);
INSERT INTO public.system_group_program VALUES (23, 2, 24);
INSERT INTO public.system_group_program VALUES (24, 2, 25);
INSERT INTO public.system_group_program VALUES (25, 1, 26);
INSERT INTO public.system_group_program VALUES (26, 1, 27);
INSERT INTO public.system_group_program VALUES (27, 1, 28);
INSERT INTO public.system_group_program VALUES (28, 1, 29);
INSERT INTO public.system_group_program VALUES (29, 2, 30);
INSERT INTO public.system_group_program VALUES (30, 1, 31);
INSERT INTO public.system_group_program VALUES (31, 1, 32);
INSERT INTO public.system_group_program VALUES (32, 1, 33);
INSERT INTO public.system_group_program VALUES (33, 1, 34);
INSERT INTO public.system_group_program VALUES (34, 1, 35);
INSERT INTO public.system_group_program VALUES (36, 1, 36);
INSERT INTO public.system_group_program VALUES (37, 1, 37);
INSERT INTO public.system_group_program VALUES (38, 1, 38);
INSERT INTO public.system_group_program VALUES (39, 1, 39);
INSERT INTO public.system_group_program VALUES (40, 1, 40);
INSERT INTO public.system_group_program VALUES (41, 1, 41);
INSERT INTO public.system_group_program VALUES (42, 2, 41);
INSERT INTO public.system_group_program VALUES (43, 1, 42);
INSERT INTO public.system_group_program VALUES (44, 2, 42);
INSERT INTO public.system_group_program VALUES (45, 1, 43);
INSERT INTO public.system_group_program VALUES (46, 2, 43);
INSERT INTO public.system_group_program VALUES (49, 1, 45);
INSERT INTO public.system_group_program VALUES (50, 2, 45);
INSERT INTO public.system_group_program VALUES (51, 1, 44);
INSERT INTO public.system_group_program VALUES (52, 2, 44);
INSERT INTO public.system_group_program VALUES (53, 1, 46);
INSERT INTO public.system_group_program VALUES (54, 2, 46);
INSERT INTO public.system_group_program VALUES (55, 1, 47);
INSERT INTO public.system_group_program VALUES (56, 2, 47);


--
-- TOC entry 3198 (class 0 OID 25621)
-- Dependencies: 214
-- Data for Name: system_message; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3199 (class 0 OID 25627)
-- Dependencies: 215
-- Data for Name: system_notification; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3200 (class 0 OID 25633)
-- Dependencies: 216
-- Data for Name: system_preference; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3201 (class 0 OID 25639)
-- Dependencies: 217
-- Data for Name: system_program; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_program VALUES (1, 'System Group Form', 'SystemGroupForm');
INSERT INTO public.system_program VALUES (2, 'System Group List', 'SystemGroupList');
INSERT INTO public.system_program VALUES (3, 'System Program Form', 'SystemProgramForm');
INSERT INTO public.system_program VALUES (4, 'System Program List', 'SystemProgramList');
INSERT INTO public.system_program VALUES (5, 'System User Form', 'SystemUserForm');
INSERT INTO public.system_program VALUES (6, 'System User List', 'SystemUserList');
INSERT INTO public.system_program VALUES (7, 'Common Page', 'CommonPage');
INSERT INTO public.system_program VALUES (8, 'System PHP Info', 'SystemPHPInfoView');
INSERT INTO public.system_program VALUES (9, 'System ChangeLog View', 'SystemChangeLogView');
INSERT INTO public.system_program VALUES (10, 'Welcome View', 'WelcomeView');
INSERT INTO public.system_program VALUES (11, 'System Sql Log', 'SystemSqlLogList');
INSERT INTO public.system_program VALUES (12, 'System Profile View', 'SystemProfileView');
INSERT INTO public.system_program VALUES (13, 'System Profile Form', 'SystemProfileForm');
INSERT INTO public.system_program VALUES (14, 'System SQL Panel', 'SystemSQLPanel');
INSERT INTO public.system_program VALUES (15, 'System Access Log', 'SystemAccessLogList');
INSERT INTO public.system_program VALUES (16, 'System Message Form', 'SystemMessageForm');
INSERT INTO public.system_program VALUES (17, 'System Message List', 'SystemMessageList');
INSERT INTO public.system_program VALUES (18, 'System Message Form View', 'SystemMessageFormView');
INSERT INTO public.system_program VALUES (19, 'System Notification List', 'SystemNotificationList');
INSERT INTO public.system_program VALUES (20, 'System Notification Form View', 'SystemNotificationFormView');
INSERT INTO public.system_program VALUES (21, 'System Document Category List', 'SystemDocumentCategoryFormList');
INSERT INTO public.system_program VALUES (22, 'System Document Form', 'SystemDocumentForm');
INSERT INTO public.system_program VALUES (23, 'System Document Upload Form', 'SystemDocumentUploadForm');
INSERT INTO public.system_program VALUES (24, 'System Document List', 'SystemDocumentList');
INSERT INTO public.system_program VALUES (25, 'System Shared Document List', 'SystemSharedDocumentList');
INSERT INTO public.system_program VALUES (26, 'System Unit Form', 'SystemUnitForm');
INSERT INTO public.system_program VALUES (27, 'System Unit List', 'SystemUnitList');
INSERT INTO public.system_program VALUES (28, 'System Access stats', 'SystemAccessLogStats');
INSERT INTO public.system_program VALUES (29, 'System Preference form', 'SystemPreferenceForm');
INSERT INTO public.system_program VALUES (30, 'System Support form', 'SystemSupportForm');
INSERT INTO public.system_program VALUES (31, 'System PHP Error', 'SystemPHPErrorLogView');
INSERT INTO public.system_program VALUES (32, 'System Database Browser', 'SystemDatabaseExplorer');
INSERT INTO public.system_program VALUES (33, 'System Table List', 'SystemTableList');
INSERT INTO public.system_program VALUES (34, 'System Data Browser', 'SystemDataBrowser');
INSERT INTO public.system_program VALUES (35, 'System Menu Editor', 'SystemMenuEditor');
INSERT INTO public.system_program VALUES (36, 'System Request Log', 'SystemRequestLogList');
INSERT INTO public.system_program VALUES (37, 'System Request Log View', 'SystemRequestLogView');
INSERT INTO public.system_program VALUES (38, 'System Administration Dashboard', 'SystemAdministrationDashboard');
INSERT INTO public.system_program VALUES (39, 'System Log Dashboard', 'SystemLogDashboard');
INSERT INTO public.system_program VALUES (40, 'System Session dump', 'SystemSessionDumpView');
INSERT INTO public.system_program VALUES (41, 'Tamanho List', 'TamanhoList');
INSERT INTO public.system_program VALUES (42, 'Produto List', 'ProdutoList');
INSERT INTO public.system_program VALUES (43, 'Cliente List', 'ClienteList');
INSERT INTO public.system_program VALUES (45, 'Venda List', 'VendaList');
INSERT INTO public.system_program VALUES (44, 'New Venda Produto', 'VendaProdutoForm');
INSERT INTO public.system_program VALUES (46, 'Venda Produto List', 'VendaProdutoList');
INSERT INTO public.system_program VALUES (47, 'New Venda', 'NewVenda');


--
-- TOC entry 3202 (class 0 OID 25642)
-- Dependencies: 218
-- Data for Name: system_request_log; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3203 (class 0 OID 25648)
-- Dependencies: 219
-- Data for Name: system_sql_log; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_sql_log VALUES (1, '2021-05-18 12:33:24', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (41, ''Tamanho List'', ''TamanhoList'')', 'INSERT', '127.0.0.1', '60a3de440a8b7', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(210): Adianti\Database\TRecord->store()
#3 [internal function]: SystemProgramForm->onSave(Array)
#4 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#6 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#7 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#8 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#9 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3de436b40b', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (2, '2021-05-18 12:33:24', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 41)', 'DELETE', '127.0.0.1', '60a3de440a8b7', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(82): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(214): SystemProgram->clearParts()
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3de436b40b', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (3, '2021-05-18 12:33:24', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (41, 1, 41)', 'INSERT', '127.0.0.1', '60a3de440a8b7', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3de436b40b', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (4, '2021-05-18 12:33:24', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (41, 2, 42)', 'INSERT', '127.0.0.1', '60a3de440a8b7', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3de436b40b', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (5, '2021-05-18 12:43:56', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (42, ''Public View'', ''ProdutoList'')', 'INSERT', '127.0.0.1', '60a3e0bc6f1e7', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(210): Adianti\Database\TRecord->store()
#3 [internal function]: SystemProgramForm->onSave(Array)
#4 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#6 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#7 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#8 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#9 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3e0bbd0e19', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (6, '2021-05-18 12:43:56', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 42)', 'DELETE', '127.0.0.1', '60a3e0bc6f1e7', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(82): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(214): SystemProgram->clearParts()
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3e0bbd0e19', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (7, '2021-05-18 12:43:56', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (42, 1, 43)', 'INSERT', '127.0.0.1', '60a3e0bc6f1e7', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3e0bbd0e19', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (8, '2021-05-18 12:43:56', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (42, 2, 44)', 'INSERT', '127.0.0.1', '60a3e0bc6f1e7', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3e0bbd0e19', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (9, '2021-05-18 12:44:36', 'admin', 'permission', 'UPDATE system_program SET name = ''Produto List'', controller = ''ProdutoList'' WHERE (id = ''42'')', 'UPDATE', '127.0.0.1', '60a3e0e49078c', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''UPDATE system_p...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''UPDATE system_p...'')
#2 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(210): Adianti\Database\TRecord->store()
#3 [internal function]: SystemProgramForm->onSave(Array)
#4 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#6 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#7 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#8 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#9 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3e0e3e1e40', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (10, '2021-05-18 12:44:36', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = ''42'')', 'DELETE', '127.0.0.1', '60a3e0e49078c', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(82): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(214): SystemProgram->clearParts()
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3e0e3e1e40', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (11, '2021-05-18 12:44:36', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (''42'', 1, 43)', 'INSERT', '127.0.0.1', '60a3e0e49078c', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3e0e3e1e40', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (12, '2021-05-18 12:44:37', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (''42'', 2, 44)', 'INSERT', '127.0.0.1', '60a3e0e49078c', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3e0e3e1e40', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (13, '2021-05-18 13:05:22', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (43, ''Cliente List'', ''ClienteList'')', 'INSERT', '127.0.0.1', '60a3e5c2c57f0', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(210): Adianti\Database\TRecord->store()
#3 [internal function]: SystemProgramForm->onSave(Array)
#4 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#6 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#7 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#8 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#9 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3e5c2174b0', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (14, '2021-05-18 13:05:23', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 43)', 'DELETE', '127.0.0.1', '60a3e5c2c57f0', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(82): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(214): SystemProgram->clearParts()
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3e5c2174b0', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (15, '2021-05-18 13:05:23', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (43, 1, 45)', 'INSERT', '127.0.0.1', '60a3e5c2c57f0', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3e5c2174b0', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (16, '2021-05-18 13:05:23', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (43, 2, 46)', 'INSERT', '127.0.0.1', '60a3e5c2c57f0', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3e5c2174b0', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (17, '2021-05-18 14:51:26', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (44, ''New Venda'', ''NewVenda'')', 'INSERT', '127.0.0.1', '60a3fe9e2dc61', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(210): Adianti\Database\TRecord->store()
#3 [internal function]: SystemProgramForm->onSave(Array)
#4 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#6 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#7 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#8 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#9 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3fe9d88d34', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (18, '2021-05-18 14:51:26', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 44)', 'DELETE', '127.0.0.1', '60a3fe9e2dc61', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(82): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(214): SystemProgram->clearParts()
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3fe9d88d34', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (19, '2021-05-18 14:51:26', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (44, 1, 47)', 'INSERT', '127.0.0.1', '60a3fe9e2dc61', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3fe9d88d34', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (20, '2021-05-18 14:51:26', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (44, 2, 48)', 'INSERT', '127.0.0.1', '60a3fe9e2dc61', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a3fe9d88d34', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (21, '2021-05-18 20:47:00', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (45, ''Venda List'', ''VendaList'')', 'INSERT', '127.0.0.1', '60a451f45cd1c', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(210): Adianti\Database\TRecord->store()
#3 [internal function]: SystemProgramForm->onSave(Array)
#4 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#6 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#7 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#8 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#9 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a451f3a951b', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (22, '2021-05-18 20:47:00', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 45)', 'DELETE', '127.0.0.1', '60a451f45cd1c', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(82): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(214): SystemProgram->clearParts()
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a451f3a951b', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (23, '2021-05-18 20:47:00', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (45, 1, 49)', 'INSERT', '127.0.0.1', '60a451f45cd1c', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a451f3a951b', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (24, '2021-05-18 20:47:00', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (45, 2, 50)', 'INSERT', '127.0.0.1', '60a451f45cd1c', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemProgramForm', 'apache2handler', '60a451f3a951b', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (25, '2021-05-18 22:18:52', 'admin', 'permission', 'INSERT INTO system_user (id, name, login, email, system_unit_id, frontpage_id, password, active) VALUES (3, ''Ana Rosa Costa Lira'', ''Ana'', ''aquariusg.rapida@gmail.com'', ''1'', ''45'', ''05634314aca96f997e9d022bc320ed8c'', ''Y'')', 'INSERT', '127.0.0.1', '60a4677cab1fe', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\control\admin\SystemUserForm.class.php(187): Adianti\Database\TRecord->store()
#3 [internal function]: SystemUserForm->onSave(Array)
#4 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#6 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#7 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#8 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#9 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemUserForm', 'apache2handler', '60a4677ba4fee', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (26, '2021-05-18 22:18:53', 'admin', 'permission', 'DELETE FROM system_user_group WHERE (system_user_id = 3)', 'DELETE', '127.0.0.1', '60a4677cab1fe', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemUser.class.php(250): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemUserForm.class.php(188): SystemUser->clearParts()
#4 [internal function]: SystemUserForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemUserForm', 'apache2handler', '60a4677ba4fee', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (27, '2021-05-18 22:18:53', 'admin', 'permission', 'DELETE FROM system_user_unit WHERE (system_user_id = 3)', 'DELETE', '127.0.0.1', '60a4677cab1fe', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemUser.class.php(251): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemUserForm.class.php(188): SystemUser->clearParts()
#4 [internal function]: SystemUserForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemUserForm', 'apache2handler', '60a4677ba4fee', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (28, '2021-05-18 22:18:53', 'admin', 'permission', 'DELETE FROM system_user_program WHERE (system_user_id = 3)', 'DELETE', '127.0.0.1', '60a4677cab1fe', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemUser.class.php(252): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemUserForm.class.php(188): SystemUser->clearParts()
#4 [internal function]: SystemUserForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemUserForm', 'apache2handler', '60a4677ba4fee', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (29, '2021-05-18 22:18:53', 'admin', 'permission', 'INSERT INTO system_user_group (system_group_id, system_user_id, id) VALUES (2, 3, 4)', 'INSERT', '127.0.0.1', '60a4677cab1fe', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemUser.class.php(127): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemUserForm.class.php(194): SystemUser->addSystemUserGroup(Object(SystemGroup))
#4 [internal function]: SystemUserForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemUserForm', 'apache2handler', '60a4677ba4fee', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (30, '2021-05-18 22:18:53', 'admin', 'permission', 'INSERT INTO system_user_unit (system_unit_id, system_user_id, id) VALUES (1, 3, 5)', 'INSERT', '127.0.0.1', '60a4677cab1fe', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemUser.class.php(139): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemUserForm.class.php(202): SystemUser->addSystemUserUnit(Object(SystemUnit))
#4 [internal function]: SystemUserForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemUserForm', 'apache2handler', '60a4677ba4fee', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (31, '2021-05-18 22:18:53', 'admin', 'permission', 'INSERT INTO system_user_program (system_program_id, system_user_id, id) VALUES (10, 3, 2)', 'INSERT', '127.0.0.1', '60a4677cab1fe', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemUser.class.php(169): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemUserForm.class.php(210): SystemUser->addSystemUserProgram(Object(SystemProgram))
#4 [internal function]: SystemUserForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemUserForm', 'apache2handler', '60a4677ba4fee', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (32, '2021-05-18 22:18:53', 'admin', 'permission', 'INSERT INTO system_user_program (system_program_id, system_user_id, id) VALUES (41, 3, 3)', 'INSERT', '127.0.0.1', '60a4677cab1fe', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemUser.class.php(169): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemUserForm.class.php(210): SystemUser->addSystemUserProgram(Object(SystemProgram))
#4 [internal function]: SystemUserForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemUserForm', 'apache2handler', '60a4677ba4fee', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (33, '2021-05-18 22:18:54', 'admin', 'permission', 'INSERT INTO system_user_program (system_program_id, system_user_id, id) VALUES (42, 3, 4)', 'INSERT', '127.0.0.1', '60a4677cab1fe', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemUser.class.php(169): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemUserForm.class.php(210): SystemUser->addSystemUserProgram(Object(SystemProgram))
#4 [internal function]: SystemUserForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemUserForm', 'apache2handler', '60a4677ba4fee', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (34, '2021-05-18 22:18:54', 'admin', 'permission', 'INSERT INTO system_user_program (system_program_id, system_user_id, id) VALUES (43, 3, 5)', 'INSERT', '127.0.0.1', '60a4677cab1fe', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemUser.class.php(169): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemUserForm.class.php(210): SystemUser->addSystemUserProgram(Object(SystemProgram))
#4 [internal function]: SystemUserForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemUserForm', 'apache2handler', '60a4677ba4fee', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (35, '2021-05-18 22:18:54', 'admin', 'permission', 'INSERT INTO system_user_program (system_program_id, system_user_id, id) VALUES (44, 3, 6)', 'INSERT', '127.0.0.1', '60a4677cab1fe', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemUser.class.php(169): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemUserForm.class.php(210): SystemUser->addSystemUserProgram(Object(SystemProgram))
#4 [internal function]: SystemUserForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemUserForm', 'apache2handler', '60a4677ba4fee', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (36, '2021-05-18 22:18:54', 'admin', 'permission', 'INSERT INTO system_user_program (system_program_id, system_user_id, id) VALUES (45, 3, 7)', 'INSERT', '127.0.0.1', '60a4677cab1fe', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemUser.class.php(169): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemUserForm.class.php(210): SystemUser->addSystemUserProgram(Object(SystemProgram))
#4 [internal function]: SystemUserForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'lp7s2etrfdenp6843njks56hv3', 'SystemUserForm', 'apache2handler', '60a4677ba4fee', '2021', '05', '18');
INSERT INTO public.system_sql_log VALUES (37, '2021-05-23 14:40:28', 'admin', 'permission', 'UPDATE system_program SET name = ''New Venda Produto'', controller = ''VendaProdutoForm'' WHERE (id = ''44'')', 'UPDATE', '127.0.0.1', '60aa938c25480', '#0 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''UPDATE system_p...'')
#1 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''UPDATE system_p...'')
#2 C:\xampp\htdocs\aquariusDev\app\control\admin\SystemProgramForm.class.php(210): Adianti\Database\TRecord->store()
#3 [internal function]: SystemProgramForm->onSave(Array)
#4 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#5 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#6 C:\xampp\htdocs\aquariusDev\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#7 C:\xampp\htdocs\aquariusDev\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#8 C:\xampp\htdocs\aquariusDev\engine.php(64): TApplication::run()
#9 {main}', '6vgji9lf7n48h6b7651burcr79', 'SystemProgramForm', 'apache2handler', '60aa938b7be25', '2021', '05', '23');
INSERT INTO public.system_sql_log VALUES (38, '2021-05-23 14:40:28', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = ''44'')', 'DELETE', '127.0.0.1', '60aa938c25480', '#0 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquariusDev\app\model\admin\SystemProgram.class.php(82): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquariusDev\app\control\admin\SystemProgramForm.class.php(214): SystemProgram->clearParts()
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquariusDev\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquariusDev\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquariusDev\engine.php(64): TApplication::run()
#10 {main}', '6vgji9lf7n48h6b7651burcr79', 'SystemProgramForm', 'apache2handler', '60aa938b7be25', '2021', '05', '23');
INSERT INTO public.system_sql_log VALUES (39, '2021-05-23 14:40:28', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (''44'', 1, 51)', 'INSERT', '127.0.0.1', '60aa938c25480', '#0 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquariusDev\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquariusDev\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquariusDev\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquariusDev\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquariusDev\engine.php(64): TApplication::run()
#10 {main}', '6vgji9lf7n48h6b7651burcr79', 'SystemProgramForm', 'apache2handler', '60aa938b7be25', '2021', '05', '23');
INSERT INTO public.system_sql_log VALUES (40, '2021-05-23 14:40:28', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (''44'', 2, 52)', 'INSERT', '127.0.0.1', '60aa938c25480', '#0 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquariusDev\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquariusDev\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquariusDev\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquariusDev\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquariusDev\engine.php(64): TApplication::run()
#10 {main}', '6vgji9lf7n48h6b7651burcr79', 'SystemProgramForm', 'apache2handler', '60aa938b7be25', '2021', '05', '23');
INSERT INTO public.system_sql_log VALUES (41, '2021-05-23 16:18:08', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (46, ''Venda Produto List'', ''VendaProdutoList'')', 'INSERT', '127.0.0.1', '60aaaa6ff360f', '#0 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquariusDev\app\control\admin\SystemProgramForm.class.php(210): Adianti\Database\TRecord->store()
#3 [internal function]: SystemProgramForm->onSave(Array)
#4 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#5 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#6 C:\xampp\htdocs\aquariusDev\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#7 C:\xampp\htdocs\aquariusDev\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#8 C:\xampp\htdocs\aquariusDev\engine.php(64): TApplication::run()
#9 {main}', '6vgji9lf7n48h6b7651burcr79', 'SystemProgramForm', 'apache2handler', '60aaaa6f5ba38', '2021', '05', '23');
INSERT INTO public.system_sql_log VALUES (42, '2021-05-23 16:18:08', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 46)', 'DELETE', '127.0.0.1', '60aaaa6ff360f', '#0 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquariusDev\app\model\admin\SystemProgram.class.php(82): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquariusDev\app\control\admin\SystemProgramForm.class.php(214): SystemProgram->clearParts()
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquariusDev\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquariusDev\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquariusDev\engine.php(64): TApplication::run()
#10 {main}', '6vgji9lf7n48h6b7651burcr79', 'SystemProgramForm', 'apache2handler', '60aaaa6f5ba38', '2021', '05', '23');
INSERT INTO public.system_sql_log VALUES (43, '2021-05-23 16:18:08', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (46, 1, 53)', 'INSERT', '127.0.0.1', '60aaaa6ff360f', '#0 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquariusDev\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquariusDev\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquariusDev\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquariusDev\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquariusDev\engine.php(64): TApplication::run()
#10 {main}', '6vgji9lf7n48h6b7651burcr79', 'SystemProgramForm', 'apache2handler', '60aaaa6f5ba38', '2021', '05', '23');
INSERT INTO public.system_sql_log VALUES (44, '2021-05-23 16:18:08', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (46, 2, 54)', 'INSERT', '127.0.0.1', '60aaaa6ff360f', '#0 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquariusDev\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquariusDev\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquariusDev\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquariusDev\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquariusDev\engine.php(64): TApplication::run()
#10 {main}', '6vgji9lf7n48h6b7651burcr79', 'SystemProgramForm', 'apache2handler', '60aaaa6f5ba38', '2021', '05', '23');
INSERT INTO public.system_sql_log VALUES (45, '2021-05-23 16:44:47', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (47, ''New Venda'', ''NewVenda'')', 'INSERT', '127.0.0.1', '60aab0afb1c35', '#0 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquariusDev\app\control\admin\SystemProgramForm.class.php(210): Adianti\Database\TRecord->store()
#3 [internal function]: SystemProgramForm->onSave(Array)
#4 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#5 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#6 C:\xampp\htdocs\aquariusDev\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#7 C:\xampp\htdocs\aquariusDev\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#8 C:\xampp\htdocs\aquariusDev\engine.php(64): TApplication::run()
#9 {main}', '6vgji9lf7n48h6b7651burcr79', 'SystemProgramForm', 'apache2handler', '60aab0af18790', '2021', '05', '23');
INSERT INTO public.system_sql_log VALUES (46, '2021-05-23 16:44:47', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 47)', 'DELETE', '127.0.0.1', '60aab0afb1c35', '#0 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquariusDev\app\model\admin\SystemProgram.class.php(82): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquariusDev\app\control\admin\SystemProgramForm.class.php(214): SystemProgram->clearParts()
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquariusDev\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquariusDev\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquariusDev\engine.php(64): TApplication::run()
#10 {main}', '6vgji9lf7n48h6b7651burcr79', 'SystemProgramForm', 'apache2handler', '60aab0af18790', '2021', '05', '23');
INSERT INTO public.system_sql_log VALUES (47, '2021-05-23 16:44:48', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (47, 1, 55)', 'INSERT', '127.0.0.1', '60aab0afb1c35', '#0 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquariusDev\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquariusDev\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquariusDev\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquariusDev\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquariusDev\engine.php(64): TApplication::run()
#10 {main}', '6vgji9lf7n48h6b7651burcr79', 'SystemProgramForm', 'apache2handler', '60aab0af18790', '2021', '05', '23');
INSERT INTO public.system_sql_log VALUES (48, '2021-05-23 16:44:48', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (47, 2, 56)', 'INSERT', '127.0.0.1', '60aab0afb1c35', '#0 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquariusDev\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquariusDev\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquariusDev\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquariusDev\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquariusDev\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquariusDev\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquariusDev\engine.php(64): TApplication::run()
#10 {main}', '6vgji9lf7n48h6b7651burcr79', 'SystemProgramForm', 'apache2handler', '60aab0af18790', '2021', '05', '23');


--
-- TOC entry 3204 (class 0 OID 25654)
-- Dependencies: 220
-- Data for Name: system_unit; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_unit VALUES (1, 'Unit A', 'unit_a');
INSERT INTO public.system_unit VALUES (2, 'Unit B', 'unit_b');


--
-- TOC entry 3205 (class 0 OID 25657)
-- Dependencies: 221
-- Data for Name: system_user; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_user VALUES (1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.net', 10, NULL, 'Y');
INSERT INTO public.system_user VALUES (2, 'User', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@user.net', 7, NULL, 'Y');
INSERT INTO public.system_user VALUES (3, 'Ana Rosa Costa Lira', 'Ana', '05634314aca96f997e9d022bc320ed8c', 'aquariusg.rapida@gmail.com', 45, 1, 'Y');


--
-- TOC entry 3206 (class 0 OID 25660)
-- Dependencies: 222
-- Data for Name: system_user_group; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_user_group VALUES (1, 1, 1);
INSERT INTO public.system_user_group VALUES (2, 2, 2);
INSERT INTO public.system_user_group VALUES (3, 1, 2);
INSERT INTO public.system_user_group VALUES (4, 3, 2);


--
-- TOC entry 3207 (class 0 OID 25663)
-- Dependencies: 223
-- Data for Name: system_user_program; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_user_program VALUES (1, 2, 7);
INSERT INTO public.system_user_program VALUES (2, 3, 10);
INSERT INTO public.system_user_program VALUES (3, 3, 41);
INSERT INTO public.system_user_program VALUES (4, 3, 42);
INSERT INTO public.system_user_program VALUES (5, 3, 43);
INSERT INTO public.system_user_program VALUES (6, 3, 44);
INSERT INTO public.system_user_program VALUES (7, 3, 45);


--
-- TOC entry 3208 (class 0 OID 25666)
-- Dependencies: 224
-- Data for Name: system_user_unit; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_user_unit VALUES (1, 1, 1);
INSERT INTO public.system_user_unit VALUES (2, 1, 2);
INSERT INTO public.system_user_unit VALUES (3, 2, 1);
INSERT INTO public.system_user_unit VALUES (4, 2, 2);
INSERT INTO public.system_user_unit VALUES (5, 3, 1);


--
-- TOC entry 3209 (class 0 OID 25669)
-- Dependencies: 225
-- Data for Name: tamanho; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.tamanho VALUES (1, 'PP');
INSERT INTO public.tamanho VALUES (2, 'P');
INSERT INTO public.tamanho VALUES (3, 'M');
INSERT INTO public.tamanho VALUES (4, 'G');
INSERT INTO public.tamanho VALUES (5, 'GG');
INSERT INTO public.tamanho VALUES (6, 'XXG');


--
-- TOC entry 3211 (class 0 OID 25675)
-- Dependencies: 227
-- Data for Name: venda_produto; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.venda_produto VALUES (137, 96, 2, 4, 5, NULL, 0, 375, NULL);
INSERT INTO public.venda_produto VALUES (149, 112, 2, 3, 1, NULL, 0, 75, NULL);
INSERT INTO public.venda_produto VALUES (151, 113, 2, 4, 115, NULL, 11, 8624.89, NULL);
INSERT INTO public.venda_produto VALUES (152, 113, 2, 3, 12, NULL, 5, 899.95, 'files/images/152/alemania local pes 13 template.png');
INSERT INTO public.venda_produto VALUES (153, 113, 2, 3, 12, NULL, 10, 899.9, NULL);


--
-- TOC entry 3213 (class 0 OID 25687)
-- Dependencies: 229
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.vendas VALUES (95, '2021-05-23 11:22:50', 1, '2021-05-23', NULL, 'obs', 1, 1, 555.55);
INSERT INTO public.vendas VALUES (96, '2021-05-23 13:29:48', 1, '2021-05-23', NULL, NULL, 1, 1, 55.55);
INSERT INTO public.vendas VALUES (106, '2021-05-23 17:04:50', 1, '2021-05-24', NULL, NULL, 1, 1, NULL);
INSERT INTO public.vendas VALUES (107, '2021-05-23 17:07:14', 1, '2021-05-25', NULL, NULL, 1, 1, NULL);
INSERT INTO public.vendas VALUES (108, '2021-05-23 17:09:44', 1, '2021-05-26', NULL, NULL, 1, 1, NULL);
INSERT INTO public.vendas VALUES (111, '2021-05-23 17:16:43', 1, '2021-05-25', NULL, NULL, 1, 1, 100);
INSERT INTO public.vendas VALUES (112, '2021-05-23 18:24:17', 1, '2021-05-23', NULL, NULL, 1, 1, 0);
INSERT INTO public.vendas VALUES (113, '2021-05-25 11:35:59', 1, '2021-05-25', NULL, NULL, 1, 1, 1100);


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 201
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.clientes_id_seq', 2, true);


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 203
-- Name: imagem_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.imagem_produto_id_seq', 2, true);


--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 205
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.produto_id_seq', 9, true);


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 226
-- Name: tamanho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.tamanho_id_seq', 6, true);


--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 228
-- Name: venda_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.venda_produto_id_seq', 153, true);


--
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 230
-- Name: vendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.vendas_id_seq', 113, true);


--
-- TOC entry 2982 (class 2606 OID 25702)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 2984 (class 2606 OID 25704)
-- Name: imagem_produto imagem_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.imagem_produto
    ADD CONSTRAINT imagem_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2986 (class 2606 OID 25706)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2988 (class 2606 OID 25708)
-- Name: system_access_log system_access_log_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_access_log
    ADD CONSTRAINT system_access_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2990 (class 2606 OID 25710)
-- Name: system_change_log system_change_log_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_change_log
    ADD CONSTRAINT system_change_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2994 (class 2606 OID 25712)
-- Name: system_document_category system_document_category_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_category
    ADD CONSTRAINT system_document_category_pkey PRIMARY KEY (id);


--
-- TOC entry 2996 (class 2606 OID 25714)
-- Name: system_document_group system_document_group_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_group
    ADD CONSTRAINT system_document_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2992 (class 2606 OID 25716)
-- Name: system_document system_document_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document
    ADD CONSTRAINT system_document_pkey PRIMARY KEY (id);


--
-- TOC entry 2998 (class 2606 OID 25718)
-- Name: system_document_user system_document_user_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_user
    ADD CONSTRAINT system_document_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3000 (class 2606 OID 25720)
-- Name: system_group system_group_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_group
    ADD CONSTRAINT system_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3004 (class 2606 OID 25722)
-- Name: system_group_program system_group_program_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_group_program
    ADD CONSTRAINT system_group_program_pkey PRIMARY KEY (id);


--
-- TOC entry 3006 (class 2606 OID 25724)
-- Name: system_message system_message_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_message
    ADD CONSTRAINT system_message_pkey PRIMARY KEY (id);


--
-- TOC entry 3008 (class 2606 OID 25726)
-- Name: system_notification system_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_notification
    ADD CONSTRAINT system_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 3010 (class 2606 OID 25728)
-- Name: system_program system_program_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_program
    ADD CONSTRAINT system_program_pkey PRIMARY KEY (id);


--
-- TOC entry 3012 (class 2606 OID 25730)
-- Name: system_request_log system_request_log_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_request_log
    ADD CONSTRAINT system_request_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3014 (class 2606 OID 25732)
-- Name: system_sql_log system_sql_log_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_sql_log
    ADD CONSTRAINT system_sql_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3016 (class 2606 OID 25734)
-- Name: system_unit system_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_unit
    ADD CONSTRAINT system_unit_pkey PRIMARY KEY (id);


--
-- TOC entry 3023 (class 2606 OID 25736)
-- Name: system_user_group system_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_group
    ADD CONSTRAINT system_user_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3019 (class 2606 OID 25738)
-- Name: system_user system_user_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user
    ADD CONSTRAINT system_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3027 (class 2606 OID 25740)
-- Name: system_user_program system_user_program_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_program
    ADD CONSTRAINT system_user_program_pkey PRIMARY KEY (id);


--
-- TOC entry 3029 (class 2606 OID 25742)
-- Name: system_user_unit system_user_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_unit
    ADD CONSTRAINT system_user_unit_pkey PRIMARY KEY (id);


--
-- TOC entry 3031 (class 2606 OID 25744)
-- Name: tamanho tamanho_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.tamanho
    ADD CONSTRAINT tamanho_pkey PRIMARY KEY (id);


--
-- TOC entry 3033 (class 2606 OID 25746)
-- Name: venda_produto venda_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3035 (class 2606 OID 25748)
-- Name: vendas vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id);


--
-- TOC entry 3001 (class 1259 OID 25749)
-- Name: sys_group_program_group_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_group_program_group_idx ON public.system_group_program USING btree (system_group_id);


--
-- TOC entry 3002 (class 1259 OID 25750)
-- Name: sys_group_program_program_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_group_program_program_idx ON public.system_group_program USING btree (system_program_id);


--
-- TOC entry 3020 (class 1259 OID 25751)
-- Name: sys_user_group_group_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_group_group_idx ON public.system_user_group USING btree (system_group_id);


--
-- TOC entry 3021 (class 1259 OID 25752)
-- Name: sys_user_group_user_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_group_user_idx ON public.system_user_group USING btree (system_user_id);


--
-- TOC entry 3017 (class 1259 OID 25753)
-- Name: sys_user_program_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_program_idx ON public.system_user USING btree (frontpage_id);


--
-- TOC entry 3024 (class 1259 OID 25754)
-- Name: sys_user_program_program_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_program_program_idx ON public.system_user_program USING btree (system_program_id);


--
-- TOC entry 3025 (class 1259 OID 25755)
-- Name: sys_user_program_user_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_program_user_idx ON public.system_user_program USING btree (system_user_id);


--
-- TOC entry 3036 (class 2606 OID 25756)
-- Name: system_document system_document_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document
    ADD CONSTRAINT system_document_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.system_document_category(id);


--
-- TOC entry 3037 (class 2606 OID 25761)
-- Name: system_document_group system_document_group_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_group
    ADD CONSTRAINT system_document_group_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.system_document(id);


--
-- TOC entry 3038 (class 2606 OID 25766)
-- Name: system_document_user system_document_user_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_user
    ADD CONSTRAINT system_document_user_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.system_document(id);


--
-- TOC entry 3039 (class 2606 OID 25771)
-- Name: system_group_program system_group_program_system_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_group_program
    ADD CONSTRAINT system_group_program_system_group_id_fkey FOREIGN KEY (system_group_id) REFERENCES public.system_group(id);


--
-- TOC entry 3040 (class 2606 OID 25776)
-- Name: system_group_program system_group_program_system_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_group_program
    ADD CONSTRAINT system_group_program_system_program_id_fkey FOREIGN KEY (system_program_id) REFERENCES public.system_program(id);


--
-- TOC entry 3041 (class 2606 OID 25781)
-- Name: system_user system_user_frontpage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user
    ADD CONSTRAINT system_user_frontpage_id_fkey FOREIGN KEY (frontpage_id) REFERENCES public.system_program(id);


--
-- TOC entry 3043 (class 2606 OID 25786)
-- Name: system_user_group system_user_group_system_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_group
    ADD CONSTRAINT system_user_group_system_group_id_fkey FOREIGN KEY (system_group_id) REFERENCES public.system_group(id);


--
-- TOC entry 3044 (class 2606 OID 25791)
-- Name: system_user_group system_user_group_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_group
    ADD CONSTRAINT system_user_group_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_user(id);


--
-- TOC entry 3045 (class 2606 OID 25796)
-- Name: system_user_program system_user_program_system_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_program
    ADD CONSTRAINT system_user_program_system_program_id_fkey FOREIGN KEY (system_program_id) REFERENCES public.system_program(id);


--
-- TOC entry 3046 (class 2606 OID 25801)
-- Name: system_user_program system_user_program_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_program
    ADD CONSTRAINT system_user_program_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_user(id);


--
-- TOC entry 3042 (class 2606 OID 25806)
-- Name: system_user system_user_system_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user
    ADD CONSTRAINT system_user_system_unit_id_fkey FOREIGN KEY (system_unit_id) REFERENCES public.system_unit(id);


--
-- TOC entry 3047 (class 2606 OID 25811)
-- Name: system_user_unit system_user_unit_system_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_unit
    ADD CONSTRAINT system_user_unit_system_unit_id_fkey FOREIGN KEY (system_unit_id) REFERENCES public.system_unit(id);


--
-- TOC entry 3048 (class 2606 OID 25816)
-- Name: system_user_unit system_user_unit_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_unit
    ADD CONSTRAINT system_user_unit_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_user(id);


--
-- TOC entry 3049 (class 2606 OID 25821)
-- Name: venda_produto venda_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_fk FOREIGN KEY (id_produto) REFERENCES public.produto(id) ON DELETE SET DEFAULT;


--
-- TOC entry 3050 (class 2606 OID 25826)
-- Name: venda_produto venda_produto_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_fk_1 FOREIGN KEY (id_venda) REFERENCES public.vendas(id) ON DELETE CASCADE;


--
-- TOC entry 3051 (class 2606 OID 25831)
-- Name: venda_produto venda_produto_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_fk_2 FOREIGN KEY (id_tamanho) REFERENCES public.tamanho(id);


--
-- TOC entry 3052 (class 2606 OID 25836)
-- Name: vendas vendas_fk; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);


--
-- TOC entry 3053 (class 2606 OID 25841)
-- Name: vendas vendas_fk1; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_fk1 FOREIGN KEY (id_vendedor) REFERENCES public.system_user(id);


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO system;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE venda_produto; Type: ACL; Schema: public; Owner: system
--

GRANT ALL ON TABLE public.venda_produto TO postgres;


-- Completed on 2021-05-25 11:37:03

--
-- PostgreSQL database dump complete
--

