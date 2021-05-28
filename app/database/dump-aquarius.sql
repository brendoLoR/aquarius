<<<<<<< HEAD
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-28 12:29:00

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
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 25338)
-- Name: clientes; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome_cliente character varying(80) NOT NULL,
    telefone character varying(20) DEFAULT '(xx) xxxxx-xxxx'::character varying NOT NULL,
    endereco character varying(150) DEFAULT 'cliente local'::character varying,
    email character varying(100),
    cpf_cnpj character varying DEFAULT '999.999.999-99'::character varying
);


ALTER TABLE public.clientes OWNER TO system;

--
-- TOC entry 225 (class 1259 OID 25336)
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
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 225
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 230 (class 1259 OID 25412)
-- Name: imagem_produto; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.imagem_produto (
    id integer NOT NULL,
    imagem_path character varying(100)
);


ALTER TABLE public.imagem_produto OWNER TO system;

--
-- TOC entry 229 (class 1259 OID 25410)
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
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 229
-- Name: imagem_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.imagem_produto_id_seq OWNED BY public.imagem_produto.id;


--
-- TOC entry 231 (class 1259 OID 33303)
-- Name: metodos_pagamento; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.metodos_pagamento (
    metodo character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.metodos_pagamento OWNER TO system;

--
-- TOC entry 232 (class 1259 OID 33310)
-- Name: metodos_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public.metodos_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metodos_pagamento_id_seq OWNER TO system;

--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 232
-- Name: metodos_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.metodos_pagamento_id_seq OWNED BY public.metodos_pagamento.id;


--
-- TOC entry 220 (class 1259 OID 25306)
-- Name: produto; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    nome_produto character varying(60) DEFAULT 'produto sem nome'::character varying NOT NULL,
    preco real DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.produto OWNER TO system;

--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE produto; Type: COMMENT; Schema: public; Owner: system
--

COMMENT ON TABLE public.produto IS 'item a ser usado em uma venda';


--
-- TOC entry 219 (class 1259 OID 25304)
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
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 219
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 208 (class 1259 OID 25178)
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
-- TOC entry 206 (class 1259 OID 25162)
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
-- TOC entry 203 (class 1259 OID 25129)
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
-- TOC entry 202 (class 1259 OID 25121)
-- Name: system_document_category; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_document_category (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.system_document_category OWNER TO system;

--
-- TOC entry 205 (class 1259 OID 25152)
-- Name: system_document_group; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_document_group (
    id integer NOT NULL,
    document_id integer,
    system_group_id integer
);


ALTER TABLE public.system_document_group OWNER TO system;

--
-- TOC entry 204 (class 1259 OID 25142)
-- Name: system_document_user; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_document_user (
    id integer NOT NULL,
    document_id integer,
    system_user_id integer
);


ALTER TABLE public.system_document_user OWNER TO system;

--
-- TOC entry 210 (class 1259 OID 25194)
-- Name: system_group; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_group (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.system_group OWNER TO system;

--
-- TOC entry 217 (class 1259 OID 25260)
-- Name: system_group_program; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_group_program (
    id integer NOT NULL,
    system_group_id integer,
    system_program_id integer
);


ALTER TABLE public.system_group_program OWNER TO system;

--
-- TOC entry 200 (class 1259 OID 25105)
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
-- TOC entry 201 (class 1259 OID 25113)
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
-- TOC entry 213 (class 1259 OID 25209)
-- Name: system_preference; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_preference (
    id text,
    value text
);


ALTER TABLE public.system_preference OWNER TO system;

--
-- TOC entry 211 (class 1259 OID 25199)
-- Name: system_program; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_program (
    id integer NOT NULL,
    name character varying(100),
    controller character varying(100)
);


ALTER TABLE public.system_program OWNER TO system;

--
-- TOC entry 209 (class 1259 OID 25186)
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
-- TOC entry 207 (class 1259 OID 25170)
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
-- TOC entry 212 (class 1259 OID 25204)
-- Name: system_unit; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_unit (
    id integer NOT NULL,
    name character varying(100),
    connection_name character varying(100)
);


ALTER TABLE public.system_unit OWNER TO system;

--
-- TOC entry 214 (class 1259 OID 25215)
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
-- TOC entry 216 (class 1259 OID 25245)
-- Name: system_user_group; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_user_group (
    id integer NOT NULL,
    system_user_id integer,
    system_group_id integer
);


ALTER TABLE public.system_user_group OWNER TO system;

--
-- TOC entry 218 (class 1259 OID 25275)
-- Name: system_user_program; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_user_program (
    id integer NOT NULL,
    system_user_id integer,
    system_program_id integer
);


ALTER TABLE public.system_user_program OWNER TO system;

--
-- TOC entry 215 (class 1259 OID 25230)
-- Name: system_user_unit; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_user_unit (
    id integer NOT NULL,
    system_user_id integer,
    system_unit_id integer
);


ALTER TABLE public.system_user_unit OWNER TO system;

--
-- TOC entry 222 (class 1259 OID 25317)
-- Name: tamanho; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.tamanho (
    id integer NOT NULL,
    tamanho character varying(3) DEFAULT 'XXX'::character varying NOT NULL
);


ALTER TABLE public.tamanho OWNER TO system;

--
-- TOC entry 221 (class 1259 OID 25315)
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
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 221
-- Name: tamanho_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.tamanho_id_seq OWNED BY public.tamanho.id;


--
-- TOC entry 234 (class 1259 OID 33427)
-- Name: tipo_entrega; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.tipo_entrega (
    id integer NOT NULL,
    tipo_entrega character varying(25)
);


ALTER TABLE public.tipo_entrega OWNER TO system;

--
-- TOC entry 233 (class 1259 OID 33425)
-- Name: tipo_entrega_id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public.tipo_entrega_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_entrega_id_seq OWNER TO system;

--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_entrega_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.tipo_entrega_id_seq OWNED BY public.tipo_entrega.id;


--
-- TOC entry 224 (class 1259 OID 25326)
-- Name: venda_produto; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.venda_produto (
    id integer NOT NULL,
    id_venda bigint NOT NULL,
    id_produto bigint NOT NULL,
    id_tamanho bigint NOT NULL,
    quantidade integer NOT NULL,
    observacao_produto text DEFAULT ''::text,
    desconto real DEFAULT 0,
    total_item double precision DEFAULT 0,
    imagem_path character varying(100) DEFAULT ''::character varying
);


ALTER TABLE public.venda_produto OWNER TO system;

--
-- TOC entry 223 (class 1259 OID 25324)
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
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 223
-- Name: venda_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.venda_produto_id_seq OWNED BY public.venda_produto.id;


--
-- TOC entry 228 (class 1259 OID 25347)
-- Name: vendas; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.vendas (
    id integer NOT NULL,
    data_venda timestamp without time zone NOT NULL,
    id_cliente bigint NOT NULL,
    data_entrega_previsto date NOT NULL,
    data_entrega_real date,
    observacao text DEFAULT ''::text,
    id_vendedor bigint NOT NULL,
    fase_producao integer NOT NULL,
    valor_pago double precision DEFAULT 0,
    frete_preco real DEFAULT 0,
    id_pagamento bigint DEFAULT 1,
    id_tipo_entrega bigint DEFAULT 1
);


ALTER TABLE public.vendas OWNER TO system;

--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN vendas.fase_producao; Type: COMMENT; Schema: public; Owner: system
--

COMMENT ON COLUMN public.vendas.fase_producao IS 'a fase será incrementada no decorrer da produção da camiseta';


--
-- TOC entry 227 (class 1259 OID 25345)
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
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 227
-- Name: vendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.vendas_id_seq OWNED BY public.vendas.id;


--
-- TOC entry 2991 (class 2604 OID 25341)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 3001 (class 2604 OID 25415)
-- Name: imagem_produto id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.imagem_produto ALTER COLUMN id SET DEFAULT nextval('public.imagem_produto_id_seq'::regclass);


--
-- TOC entry 3002 (class 2604 OID 33312)
-- Name: metodos_pagamento id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.metodos_pagamento ALTER COLUMN id SET DEFAULT nextval('public.metodos_pagamento_id_seq'::regclass);


--
-- TOC entry 2981 (class 2604 OID 25309)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 2984 (class 2604 OID 25320)
-- Name: tamanho id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.tamanho ALTER COLUMN id SET DEFAULT nextval('public.tamanho_id_seq'::regclass);


--
-- TOC entry 3003 (class 2604 OID 33430)
-- Name: tipo_entrega id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.tipo_entrega ALTER COLUMN id SET DEFAULT nextval('public.tipo_entrega_id_seq'::regclass);


--
-- TOC entry 2986 (class 2604 OID 25329)
-- Name: venda_produto id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto ALTER COLUMN id SET DEFAULT nextval('public.venda_produto_id_seq'::regclass);


--
-- TOC entry 2995 (class 2604 OID 25350)
-- Name: vendas id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas ALTER COLUMN id SET DEFAULT nextval('public.vendas_id_seq'::regclass);


--
-- TOC entry 3239 (class 0 OID 25338)
-- Dependencies: 226
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.clientes VALUES (1, 'BRENDO JACKSON LEITE DA SILVA', '84 99809-3102', '''cliente local''', 'brendoja@hotmail.com', NULL);
INSERT INTO public.clientes VALUES (3, 'CLIENTE AVULSO', '99 99999-9999', NULL, 'avulso@avulso.com', '000.000.000-00');
INSERT INTO public.clientes VALUES (4, 'OLANIEL TUDO SOBRE PESCA', '84 987193446', NULL, 'cliente@cliente.com', '999.999.999-99');


--
-- TOC entry 3243 (class 0 OID 25412)
-- Dependencies: 230
-- Data for Name: imagem_produto; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.imagem_produto VALUES (1, NULL);
INSERT INTO public.imagem_produto VALUES (2, NULL);


--
-- TOC entry 3244 (class 0 OID 33303)
-- Dependencies: 231
-- Data for Name: metodos_pagamento; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.metodos_pagamento VALUES ('Dinheiro', 1);
INSERT INTO public.metodos_pagamento VALUES ('Cartão', 2);


--
-- TOC entry 3233 (class 0 OID 25306)
-- Dependencies: 220
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.produto VALUES (1, 'Camisa Basica', 20);
INSERT INTO public.produto VALUES (9, 'Camisa ciclismo M L zíper 15cm IND', 85);
INSERT INTO public.produto VALUES (2, 'Camisa ciclismo M C zíper 15cm IND', 75);
INSERT INTO public.produto VALUES (11, 'Camisa adulto P/ Pesca Bas. M. L. Dry Fit Revenda', 45);
INSERT INTO public.produto VALUES (12, 'Camisa Infantil P/ Pesca Bas. M. L. Dry Fit Revenda', 40);
INSERT INTO public.produto VALUES (13, 'Ribana Dry Fit Revenda', 23);


--
-- TOC entry 3221 (class 0 OID 25178)
-- Dependencies: 208
-- Data for Name: system_access_log; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_access_log VALUES (1, 'lp7s2etrfdenp6843njks56hv3', 'admin', '2021-05-18 11:25:31', '2021', '05', '18', '2021-05-18 22:19:16', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (3, '4dbjq3mdd8kndnnaflenpljs5e', 'Ana', '2021-05-18 23:19:45', '2021', '05', '18', NULL, 'N', '192.168.1.12');
INSERT INTO public.system_access_log VALUES (2, 'gnigc8e8n0hm8tut34bqgjcsdc', 'Ana', '2021-05-18 22:19:33', '2021', '05', '18', '2021-05-19 00:06:54', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (4, 't75enj1s3kasffoj7jslb9vnnm', 'admin', '2021-05-19 00:07:00', '2021', '05', '19', '2021-05-19 00:08:45', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (5, 'lhcf933mdco7v4prkmf67f0m2g', 'admin', '2021-05-19 18:43:25', '2021', '05', '19', NULL, 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (6, 'titm09lgf1ju3nvap0uc1rr1bu', 'Ana', '2021-05-20 06:18:25', '2021', '05', '20', NULL, 'N', '192.168.1.12');
INSERT INTO public.system_access_log VALUES (7, '2a31nh84e4eachk6u1ck07j9tt', 'Ana', '2021-05-20 18:44:14', '2021', '05', '20', NULL, 'N', '192.168.1.18');
INSERT INTO public.system_access_log VALUES (9, '42jbblm22li7kn63lnr29a5oi1', 'Ana', '2021-05-25 16:37:02', '2021', '05', '25', NULL, 'N', '192.168.1.12');
INSERT INTO public.system_access_log VALUES (10, 'bl4ig3ocdmkv0qubdma95d9l0f', 'Ana', '2021-05-25 16:42:45', '2021', '05', '25', NULL, 'N', '192.168.1.10');
INSERT INTO public.system_access_log VALUES (8, 'o5bolhd6phfhi2guofup1etd5a', 'admin', '2021-05-25 12:05:48', '2021', '05', '25', '2021-05-25 22:57:39', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (11, 'b49n41blpoatlkesfj7tblj050', 'admin', '2021-05-25 22:57:47', '2021', '05', '25', NULL, 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (12, 'c8814df5kv823q97a83b2cuvh5', 'admin', '2021-05-25 23:51:57', '2021', '05', '25', NULL, 'N', '::1');
INSERT INTO public.system_access_log VALUES (13, 'n6b6am6q8joek5juoq71jvl7n8', 'Ana', '2021-05-26 05:33:41', '2021', '05', '26', NULL, 'N', '192.168.1.12');
INSERT INTO public.system_access_log VALUES (14, '19tshqhpj4u6riendc1qr32009', 'Ana', '2021-05-26 05:35:48', '2021', '05', '26', NULL, 'N', '192.168.1.12');
INSERT INTO public.system_access_log VALUES (15, 'g5or0pebd0p9vk1m2k305qr83v', 'Ana', '2021-05-26 13:33:41', '2021', '05', '26', NULL, 'N', '192.168.1.10');
INSERT INTO public.system_access_log VALUES (16, 'm7k87cmcu8mtdco49k83ff2gnf', 'Ana', '2021-05-27 23:27:23', '2021', '05', '27', '2021-05-27 23:27:42', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (17, 'ipu4e2obolh8f8honnamkfdomb', 'Ana', '2021-05-28 09:40:41', '2021', '05', '28', '2021-05-28 09:41:01', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (18, '4lnpa1dvu93fi5udcp08dvcleb', 'admin', '2021-05-28 09:41:06', '2021', '05', '28', NULL, 'N', '127.0.0.1');


--
-- TOC entry 3219 (class 0 OID 25162)
-- Dependencies: 206
-- Data for Name: system_change_log; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3216 (class 0 OID 25129)
-- Dependencies: 203
-- Data for Name: system_document; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3215 (class 0 OID 25121)
-- Dependencies: 202
-- Data for Name: system_document_category; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_document_category VALUES (1, 'Documentação');


--
-- TOC entry 3218 (class 0 OID 25152)
-- Dependencies: 205
-- Data for Name: system_document_group; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3217 (class 0 OID 25142)
-- Dependencies: 204
-- Data for Name: system_document_user; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3223 (class 0 OID 25194)
-- Dependencies: 210
-- Data for Name: system_group; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_group VALUES (1, 'Admin');
INSERT INTO public.system_group VALUES (2, 'Standard');


--
-- TOC entry 3230 (class 0 OID 25260)
-- Dependencies: 217
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
INSERT INTO public.system_group_program VALUES (47, 1, 44);
INSERT INTO public.system_group_program VALUES (48, 2, 44);
INSERT INTO public.system_group_program VALUES (49, 1, 45);
INSERT INTO public.system_group_program VALUES (50, 2, 45);
INSERT INTO public.system_group_program VALUES (51, 1, 46);
INSERT INTO public.system_group_program VALUES (52, 2, 46);


--
-- TOC entry 3213 (class 0 OID 25105)
-- Dependencies: 200
-- Data for Name: system_message; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3214 (class 0 OID 25113)
-- Dependencies: 201
-- Data for Name: system_notification; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3226 (class 0 OID 25209)
-- Dependencies: 213
-- Data for Name: system_preference; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3224 (class 0 OID 25199)
-- Dependencies: 211
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
INSERT INTO public.system_program VALUES (44, 'New Venda', 'NewVenda');
INSERT INTO public.system_program VALUES (45, 'Venda List', 'VendaList');
INSERT INTO public.system_program VALUES (46, 'PDFCreate', 'PDFCreate');


--
-- TOC entry 3222 (class 0 OID 25186)
-- Dependencies: 209
-- Data for Name: system_request_log; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3220 (class 0 OID 25170)
-- Dependencies: 207
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
INSERT INTO public.system_sql_log VALUES (37, '2021-05-25 13:03:05', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (46, ''PDFCreate'', ''PDFCreate'')', 'INSERT', '127.0.0.1', '60ad1fb99966f', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(210): Adianti\Database\TRecord->store()
#3 [internal function]: SystemProgramForm->onSave(Array)
#4 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#6 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#7 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#8 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#9 {main}', 'o5bolhd6phfhi2guofup1etd5a', 'SystemProgramForm', 'apache2handler', '60ad1fb965789', '2021', '05', '25');
INSERT INTO public.system_sql_log VALUES (38, '2021-05-25 13:03:05', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 46)', 'DELETE', '127.0.0.1', '60ad1fb99966f', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(82): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(214): SystemProgram->clearParts()
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'o5bolhd6phfhi2guofup1etd5a', 'SystemProgramForm', 'apache2handler', '60ad1fb965789', '2021', '05', '25');
INSERT INTO public.system_sql_log VALUES (39, '2021-05-25 13:03:05', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (46, 1, 51)', 'INSERT', '127.0.0.1', '60ad1fb99966f', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'o5bolhd6phfhi2guofup1etd5a', 'SystemProgramForm', 'apache2handler', '60ad1fb965789', '2021', '05', '25');
INSERT INTO public.system_sql_log VALUES (40, '2021-05-25 13:03:05', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (46, 2, 52)', 'INSERT', '127.0.0.1', '60ad1fb99966f', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'o5bolhd6phfhi2guofup1etd5a', 'SystemProgramForm', 'apache2handler', '60ad1fb965789', '2021', '05', '25');


--
-- TOC entry 3225 (class 0 OID 25204)
-- Dependencies: 212
-- Data for Name: system_unit; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_unit VALUES (1, 'Unit A', 'unit_a');
INSERT INTO public.system_unit VALUES (2, 'Unit B', 'unit_b');


--
-- TOC entry 3227 (class 0 OID 25215)
-- Dependencies: 214
-- Data for Name: system_user; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_user VALUES (1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.net', 10, NULL, 'Y');
INSERT INTO public.system_user VALUES (2, 'User', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@user.net', 7, NULL, 'Y');
INSERT INTO public.system_user VALUES (3, 'Ana Rosa Costa Lira', 'Ana', '05634314aca96f997e9d022bc320ed8c', 'aquariusg.rapida@gmail.com', 45, 1, 'Y');


--
-- TOC entry 3229 (class 0 OID 25245)
-- Dependencies: 216
-- Data for Name: system_user_group; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_user_group VALUES (1, 1, 1);
INSERT INTO public.system_user_group VALUES (2, 2, 2);
INSERT INTO public.system_user_group VALUES (3, 1, 2);
INSERT INTO public.system_user_group VALUES (4, 3, 2);


--
-- TOC entry 3231 (class 0 OID 25275)
-- Dependencies: 218
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
-- TOC entry 3228 (class 0 OID 25230)
-- Dependencies: 215
-- Data for Name: system_user_unit; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_user_unit VALUES (1, 1, 1);
INSERT INTO public.system_user_unit VALUES (2, 1, 2);
INSERT INTO public.system_user_unit VALUES (3, 2, 1);
INSERT INTO public.system_user_unit VALUES (4, 2, 2);
INSERT INTO public.system_user_unit VALUES (5, 3, 1);


--
-- TOC entry 3235 (class 0 OID 25317)
-- Dependencies: 222
-- Data for Name: tamanho; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.tamanho VALUES (1, 'PP');
INSERT INTO public.tamanho VALUES (2, 'P');
INSERT INTO public.tamanho VALUES (3, 'M');
INSERT INTO public.tamanho VALUES (4, 'G');
INSERT INTO public.tamanho VALUES (5, 'GG');
INSERT INTO public.tamanho VALUES (6, 'XXG');


--
-- TOC entry 3247 (class 0 OID 33427)
-- Dependencies: 234
-- Data for Name: tipo_entrega; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.tipo_entrega VALUES (1, 'CORREIOS');
INSERT INTO public.tipo_entrega VALUES (2, 'RETIRADA');
INSERT INTO public.tipo_entrega VALUES (3, 'FRETE LOCAL');


--
-- TOC entry 3237 (class 0 OID 25326)
-- Dependencies: 224
-- Data for Name: venda_produto; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.venda_produto VALUES (129, 98, 11, 1, 27, NULL, 0, 1215, NULL);
INSERT INTO public.venda_produto VALUES (130, 98, 12, 1, 7, NULL, 0, 280, NULL);
INSERT INTO public.venda_produto VALUES (131, 98, 13, 1, 10, NULL, 0, 230, NULL);


--
-- TOC entry 3241 (class 0 OID 25347)
-- Dependencies: 228
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.vendas VALUES (98, '2021-05-26 18:59:56', 4, '2021-05-26', NULL, NULL, 3, 1, 862.5, 0, 1, 3);


--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 225
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.clientes_id_seq', 4, true);


--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 229
-- Name: imagem_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.imagem_produto_id_seq', 2, true);


--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 232
-- Name: metodos_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.metodos_pagamento_id_seq', 2, true);


--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 219
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.produto_id_seq', 13, true);


--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 221
-- Name: tamanho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.tamanho_id_seq', 6, true);


--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_entrega_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.tipo_entrega_id_seq', 3, true);


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 223
-- Name: venda_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.venda_produto_id_seq', 131, true);


--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 227
-- Name: vendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.vendas_id_seq', 98, true);


--
-- TOC entry 3054 (class 2606 OID 25344)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3058 (class 2606 OID 25417)
-- Name: imagem_produto imagem_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.imagem_produto
    ADD CONSTRAINT imagem_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3060 (class 2606 OID 33314)
-- Name: metodos_pagamento metodos_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.metodos_pagamento
    ADD CONSTRAINT metodos_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3048 (class 2606 OID 25312)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3021 (class 2606 OID 25185)
-- Name: system_access_log system_access_log_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_access_log
    ADD CONSTRAINT system_access_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3017 (class 2606 OID 25169)
-- Name: system_change_log system_change_log_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_change_log
    ADD CONSTRAINT system_change_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3009 (class 2606 OID 25128)
-- Name: system_document_category system_document_category_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_category
    ADD CONSTRAINT system_document_category_pkey PRIMARY KEY (id);


--
-- TOC entry 3015 (class 2606 OID 25156)
-- Name: system_document_group system_document_group_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_group
    ADD CONSTRAINT system_document_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3011 (class 2606 OID 25136)
-- Name: system_document system_document_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document
    ADD CONSTRAINT system_document_pkey PRIMARY KEY (id);


--
-- TOC entry 3013 (class 2606 OID 25146)
-- Name: system_document_user system_document_user_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_user
    ADD CONSTRAINT system_document_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3025 (class 2606 OID 25198)
-- Name: system_group system_group_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_group
    ADD CONSTRAINT system_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3042 (class 2606 OID 25264)
-- Name: system_group_program system_group_program_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_group_program
    ADD CONSTRAINT system_group_program_pkey PRIMARY KEY (id);


--
-- TOC entry 3005 (class 2606 OID 25112)
-- Name: system_message system_message_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_message
    ADD CONSTRAINT system_message_pkey PRIMARY KEY (id);


--
-- TOC entry 3007 (class 2606 OID 25120)
-- Name: system_notification system_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_notification
    ADD CONSTRAINT system_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 3027 (class 2606 OID 25203)
-- Name: system_program system_program_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_program
    ADD CONSTRAINT system_program_pkey PRIMARY KEY (id);


--
-- TOC entry 3023 (class 2606 OID 25193)
-- Name: system_request_log system_request_log_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_request_log
    ADD CONSTRAINT system_request_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3019 (class 2606 OID 25177)
-- Name: system_sql_log system_sql_log_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_sql_log
    ADD CONSTRAINT system_sql_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3029 (class 2606 OID 25208)
-- Name: system_unit system_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_unit
    ADD CONSTRAINT system_unit_pkey PRIMARY KEY (id);


--
-- TOC entry 3038 (class 2606 OID 25249)
-- Name: system_user_group system_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_group
    ADD CONSTRAINT system_user_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3032 (class 2606 OID 25219)
-- Name: system_user system_user_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user
    ADD CONSTRAINT system_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3046 (class 2606 OID 25279)
-- Name: system_user_program system_user_program_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_program
    ADD CONSTRAINT system_user_program_pkey PRIMARY KEY (id);


--
-- TOC entry 3034 (class 2606 OID 25234)
-- Name: system_user_unit system_user_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_unit
    ADD CONSTRAINT system_user_unit_pkey PRIMARY KEY (id);


--
-- TOC entry 3050 (class 2606 OID 25323)
-- Name: tamanho tamanho_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.tamanho
    ADD CONSTRAINT tamanho_pkey PRIMARY KEY (id);


--
-- TOC entry 3062 (class 2606 OID 33432)
-- Name: tipo_entrega tipo_entrega_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.tipo_entrega
    ADD CONSTRAINT tipo_entrega_pkey PRIMARY KEY (id);


--
-- TOC entry 3052 (class 2606 OID 25335)
-- Name: venda_produto venda_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3056 (class 2606 OID 25355)
-- Name: vendas vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id);


--
-- TOC entry 3039 (class 1259 OID 25294)
-- Name: sys_group_program_group_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_group_program_group_idx ON public.system_group_program USING btree (system_group_id);


--
-- TOC entry 3040 (class 1259 OID 25293)
-- Name: sys_group_program_program_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_group_program_program_idx ON public.system_group_program USING btree (system_program_id);


--
-- TOC entry 3035 (class 1259 OID 25291)
-- Name: sys_user_group_group_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_group_group_idx ON public.system_user_group USING btree (system_group_id);


--
-- TOC entry 3036 (class 1259 OID 25292)
-- Name: sys_user_group_user_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_group_user_idx ON public.system_user_group USING btree (system_user_id);


--
-- TOC entry 3030 (class 1259 OID 25290)
-- Name: sys_user_program_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_program_idx ON public.system_user USING btree (frontpage_id);


--
-- TOC entry 3043 (class 1259 OID 25295)
-- Name: sys_user_program_program_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_program_program_idx ON public.system_user_program USING btree (system_program_id);


--
-- TOC entry 3044 (class 1259 OID 25296)
-- Name: sys_user_program_user_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_program_user_idx ON public.system_user_program USING btree (system_user_id);


--
-- TOC entry 3063 (class 2606 OID 25137)
-- Name: system_document system_document_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document
    ADD CONSTRAINT system_document_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.system_document_category(id);


--
-- TOC entry 3065 (class 2606 OID 25157)
-- Name: system_document_group system_document_group_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_group
    ADD CONSTRAINT system_document_group_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.system_document(id);


--
-- TOC entry 3064 (class 2606 OID 25147)
-- Name: system_document_user system_document_user_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_user
    ADD CONSTRAINT system_document_user_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.system_document(id);


--
-- TOC entry 3072 (class 2606 OID 25265)
-- Name: system_group_program system_group_program_system_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_group_program
    ADD CONSTRAINT system_group_program_system_group_id_fkey FOREIGN KEY (system_group_id) REFERENCES public.system_group(id);


--
-- TOC entry 3073 (class 2606 OID 25270)
-- Name: system_group_program system_group_program_system_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_group_program
    ADD CONSTRAINT system_group_program_system_program_id_fkey FOREIGN KEY (system_program_id) REFERENCES public.system_program(id);


--
-- TOC entry 3067 (class 2606 OID 25225)
-- Name: system_user system_user_frontpage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user
    ADD CONSTRAINT system_user_frontpage_id_fkey FOREIGN KEY (frontpage_id) REFERENCES public.system_program(id);


--
-- TOC entry 3071 (class 2606 OID 25255)
-- Name: system_user_group system_user_group_system_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_group
    ADD CONSTRAINT system_user_group_system_group_id_fkey FOREIGN KEY (system_group_id) REFERENCES public.system_group(id);


--
-- TOC entry 3070 (class 2606 OID 25250)
-- Name: system_user_group system_user_group_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_group
    ADD CONSTRAINT system_user_group_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_user(id);


--
-- TOC entry 3075 (class 2606 OID 25285)
-- Name: system_user_program system_user_program_system_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_program
    ADD CONSTRAINT system_user_program_system_program_id_fkey FOREIGN KEY (system_program_id) REFERENCES public.system_program(id);


--
-- TOC entry 3074 (class 2606 OID 25280)
-- Name: system_user_program system_user_program_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_program
    ADD CONSTRAINT system_user_program_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_user(id);


--
-- TOC entry 3066 (class 2606 OID 25220)
-- Name: system_user system_user_system_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user
    ADD CONSTRAINT system_user_system_unit_id_fkey FOREIGN KEY (system_unit_id) REFERENCES public.system_unit(id);


--
-- TOC entry 3069 (class 2606 OID 25240)
-- Name: system_user_unit system_user_unit_system_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_unit
    ADD CONSTRAINT system_user_unit_system_unit_id_fkey FOREIGN KEY (system_unit_id) REFERENCES public.system_unit(id);


--
-- TOC entry 3068 (class 2606 OID 25235)
-- Name: system_user_unit system_user_unit_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_unit
    ADD CONSTRAINT system_user_unit_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_user(id);


--
-- TOC entry 3076 (class 2606 OID 25364)
-- Name: venda_produto venda_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_fk FOREIGN KEY (id_produto) REFERENCES public.produto(id) ON DELETE SET DEFAULT;


--
-- TOC entry 3078 (class 2606 OID 25385)
-- Name: venda_produto venda_produto_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_fk_1 FOREIGN KEY (id_venda) REFERENCES public.vendas(id) ON DELETE CASCADE;


--
-- TOC entry 3077 (class 2606 OID 25374)
-- Name: venda_produto venda_produto_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_fk_2 FOREIGN KEY (id_tamanho) REFERENCES public.tamanho(id);


--
-- TOC entry 3079 (class 2606 OID 25356)
-- Name: vendas vendas_fk; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);


--
-- TOC entry 3080 (class 2606 OID 25379)
-- Name: vendas vendas_fk1; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_fk1 FOREIGN KEY (id_vendedor) REFERENCES public.system_user(id);


--
-- TOC entry 3081 (class 2606 OID 33403)
-- Name: vendas vendas_fk2; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_fk2 FOREIGN KEY (id_pagamento) REFERENCES public.metodos_pagamento(id);


--
-- TOC entry 3082 (class 2606 OID 33433)
-- Name: vendas vendas_fk3; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_fk3 FOREIGN KEY (id_tipo_entrega) REFERENCES public.tipo_entrega(id);


-- Completed on 2021-05-28 12:29:00

--
-- PostgreSQL database dump complete
--

=======
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-26 19:41:47

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
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 25338)
-- Name: clientes; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome_cliente character varying(80) NOT NULL,
    telefone character varying(20) DEFAULT '(xx) xxxxx-xxxx'::character varying NOT NULL,
    endereco character varying(150) DEFAULT 'cliente local'::character varying,
    email character varying(100),
    cpf_cnpj character varying DEFAULT '999.999.999-99'::character varying
);


ALTER TABLE public.clientes OWNER TO system;

--
-- TOC entry 225 (class 1259 OID 25336)
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
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 225
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 230 (class 1259 OID 25412)
-- Name: imagem_produto; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.imagem_produto (
    id integer NOT NULL,
    imagem_path character varying(100)
);


ALTER TABLE public.imagem_produto OWNER TO system;

--
-- TOC entry 229 (class 1259 OID 25410)
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
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 229
-- Name: imagem_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.imagem_produto_id_seq OWNED BY public.imagem_produto.id;


--
-- TOC entry 231 (class 1259 OID 33303)
-- Name: metodos_pagamento; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.metodos_pagamento (
    metodo character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.metodos_pagamento OWNER TO system;

--
-- TOC entry 232 (class 1259 OID 33310)
-- Name: metodos_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public.metodos_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metodos_pagamento_id_seq OWNER TO system;

--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 232
-- Name: metodos_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.metodos_pagamento_id_seq OWNED BY public.metodos_pagamento.id;


--
-- TOC entry 220 (class 1259 OID 25306)
-- Name: produto; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    nome_produto character varying(60) DEFAULT 'produto sem nome'::character varying NOT NULL,
    preco real DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.produto OWNER TO system;

--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE produto; Type: COMMENT; Schema: public; Owner: system
--

COMMENT ON TABLE public.produto IS 'item a ser usado em uma venda';


--
-- TOC entry 219 (class 1259 OID 25304)
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
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 219
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 208 (class 1259 OID 25178)
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
-- TOC entry 206 (class 1259 OID 25162)
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
-- TOC entry 203 (class 1259 OID 25129)
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
-- TOC entry 202 (class 1259 OID 25121)
-- Name: system_document_category; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_document_category (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.system_document_category OWNER TO system;

--
-- TOC entry 205 (class 1259 OID 25152)
-- Name: system_document_group; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_document_group (
    id integer NOT NULL,
    document_id integer,
    system_group_id integer
);


ALTER TABLE public.system_document_group OWNER TO system;

--
-- TOC entry 204 (class 1259 OID 25142)
-- Name: system_document_user; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_document_user (
    id integer NOT NULL,
    document_id integer,
    system_user_id integer
);


ALTER TABLE public.system_document_user OWNER TO system;

--
-- TOC entry 210 (class 1259 OID 25194)
-- Name: system_group; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_group (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.system_group OWNER TO system;

--
-- TOC entry 217 (class 1259 OID 25260)
-- Name: system_group_program; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_group_program (
    id integer NOT NULL,
    system_group_id integer,
    system_program_id integer
);


ALTER TABLE public.system_group_program OWNER TO system;

--
-- TOC entry 200 (class 1259 OID 25105)
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
-- TOC entry 201 (class 1259 OID 25113)
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
-- TOC entry 213 (class 1259 OID 25209)
-- Name: system_preference; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_preference (
    id text,
    value text
);


ALTER TABLE public.system_preference OWNER TO system;

--
-- TOC entry 211 (class 1259 OID 25199)
-- Name: system_program; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_program (
    id integer NOT NULL,
    name character varying(100),
    controller character varying(100)
);


ALTER TABLE public.system_program OWNER TO system;

--
-- TOC entry 209 (class 1259 OID 25186)
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
-- TOC entry 207 (class 1259 OID 25170)
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
-- TOC entry 212 (class 1259 OID 25204)
-- Name: system_unit; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_unit (
    id integer NOT NULL,
    name character varying(100),
    connection_name character varying(100)
);


ALTER TABLE public.system_unit OWNER TO system;

--
-- TOC entry 214 (class 1259 OID 25215)
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
-- TOC entry 216 (class 1259 OID 25245)
-- Name: system_user_group; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_user_group (
    id integer NOT NULL,
    system_user_id integer,
    system_group_id integer
);


ALTER TABLE public.system_user_group OWNER TO system;

--
-- TOC entry 218 (class 1259 OID 25275)
-- Name: system_user_program; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_user_program (
    id integer NOT NULL,
    system_user_id integer,
    system_program_id integer
);


ALTER TABLE public.system_user_program OWNER TO system;

--
-- TOC entry 215 (class 1259 OID 25230)
-- Name: system_user_unit; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.system_user_unit (
    id integer NOT NULL,
    system_user_id integer,
    system_unit_id integer
);


ALTER TABLE public.system_user_unit OWNER TO system;

--
-- TOC entry 222 (class 1259 OID 25317)
-- Name: tamanho; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.tamanho (
    id integer NOT NULL,
    tamanho character varying(3) DEFAULT 'XXX'::character varying NOT NULL
);


ALTER TABLE public.tamanho OWNER TO system;

--
-- TOC entry 221 (class 1259 OID 25315)
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
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 221
-- Name: tamanho_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.tamanho_id_seq OWNED BY public.tamanho.id;


--
-- TOC entry 234 (class 1259 OID 33427)
-- Name: tipo_entrega; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.tipo_entrega (
    id integer NOT NULL,
    tipo_entrega character varying(25)
);


ALTER TABLE public.tipo_entrega OWNER TO system;

--
-- TOC entry 233 (class 1259 OID 33425)
-- Name: tipo_entrega_id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public.tipo_entrega_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_entrega_id_seq OWNER TO system;

--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_entrega_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.tipo_entrega_id_seq OWNED BY public.tipo_entrega.id;


--
-- TOC entry 224 (class 1259 OID 25326)
-- Name: venda_produto; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.venda_produto (
    id integer NOT NULL,
    id_venda bigint NOT NULL,
    id_produto bigint NOT NULL,
    id_tamanho bigint NOT NULL,
    quantidade integer NOT NULL,
    observacao_produto text DEFAULT ''::text,
    desconto real DEFAULT 0,
    total_item double precision DEFAULT 0,
    imagem_path character varying(100) DEFAULT ''::character varying
);


ALTER TABLE public.venda_produto OWNER TO system;

--
-- TOC entry 223 (class 1259 OID 25324)
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
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 223
-- Name: venda_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.venda_produto_id_seq OWNED BY public.venda_produto.id;


--
-- TOC entry 228 (class 1259 OID 25347)
-- Name: vendas; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.vendas (
    id integer NOT NULL,
    data_venda timestamp without time zone NOT NULL,
    id_cliente bigint NOT NULL,
    data_entrega_previsto date NOT NULL,
    data_entrega_real date,
    observacao text DEFAULT ''::text,
    id_vendedor bigint NOT NULL,
    fase_producao integer NOT NULL,
    valor_pago double precision DEFAULT 0,
    frete_preco real DEFAULT 0,
    id_pagamento bigint DEFAULT 1,
    id_tipo_entrega bigint DEFAULT 1
);


ALTER TABLE public.vendas OWNER TO system;

--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN vendas.fase_producao; Type: COMMENT; Schema: public; Owner: system
--

COMMENT ON COLUMN public.vendas.fase_producao IS 'a fase será incrementada no decorrer da produção da camiseta';


--
-- TOC entry 227 (class 1259 OID 25345)
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
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 227
-- Name: vendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public.vendas_id_seq OWNED BY public.vendas.id;


--
-- TOC entry 2991 (class 2604 OID 25341)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 3001 (class 2604 OID 25415)
-- Name: imagem_produto id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.imagem_produto ALTER COLUMN id SET DEFAULT nextval('public.imagem_produto_id_seq'::regclass);


--
-- TOC entry 3002 (class 2604 OID 33312)
-- Name: metodos_pagamento id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.metodos_pagamento ALTER COLUMN id SET DEFAULT nextval('public.metodos_pagamento_id_seq'::regclass);


--
-- TOC entry 2981 (class 2604 OID 25309)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 2984 (class 2604 OID 25320)
-- Name: tamanho id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.tamanho ALTER COLUMN id SET DEFAULT nextval('public.tamanho_id_seq'::regclass);


--
-- TOC entry 3003 (class 2604 OID 33430)
-- Name: tipo_entrega id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.tipo_entrega ALTER COLUMN id SET DEFAULT nextval('public.tipo_entrega_id_seq'::regclass);


--
-- TOC entry 2986 (class 2604 OID 25329)
-- Name: venda_produto id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto ALTER COLUMN id SET DEFAULT nextval('public.venda_produto_id_seq'::regclass);


--
-- TOC entry 2995 (class 2604 OID 25350)
-- Name: vendas id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas ALTER COLUMN id SET DEFAULT nextval('public.vendas_id_seq'::regclass);


--
-- TOC entry 3239 (class 0 OID 25338)
-- Dependencies: 226
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.clientes VALUES (1, 'BRENDO JACKSON LEITE DA SILVA', '84 99809-3102', '''cliente local''', 'brendoja@hotmail.com', NULL);
INSERT INTO public.clientes VALUES (3, 'CLIENTE AVULSO', '99 99999-9999', NULL, 'avulso@avulso.com', '000.000.000-00');
INSERT INTO public.clientes VALUES (4, 'OLANIEL TUDO SOBRE PESCA', '84 987193446', NULL, 'cliente@cliente.com', '999.999.999-99');


--
-- TOC entry 3243 (class 0 OID 25412)
-- Dependencies: 230
-- Data for Name: imagem_produto; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.imagem_produto VALUES (1, NULL);
INSERT INTO public.imagem_produto VALUES (2, NULL);


--
-- TOC entry 3244 (class 0 OID 33303)
-- Dependencies: 231
-- Data for Name: metodos_pagamento; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.metodos_pagamento VALUES ('Dinheiro', 1);
INSERT INTO public.metodos_pagamento VALUES ('Cartão', 2);


--
-- TOC entry 3233 (class 0 OID 25306)
-- Dependencies: 220
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.produto VALUES (1, 'Camisa Basica', 20);
INSERT INTO public.produto VALUES (9, 'Camisa ciclismo M L zíper 15cm IND', 85);
INSERT INTO public.produto VALUES (2, 'Camisa ciclismo M C zíper 15cm IND', 75);
INSERT INTO public.produto VALUES (11, 'Camisa adulto P/ Pesca Bas. M. L. Dry Fit Revenda', 45);
INSERT INTO public.produto VALUES (12, 'Camisa Infantil P/ Pesca Bas. M. L. Dry Fit Revenda', 40);
INSERT INTO public.produto VALUES (13, 'Ribana Dry Fit Revenda', 23);


--
-- TOC entry 3221 (class 0 OID 25178)
-- Dependencies: 208
-- Data for Name: system_access_log; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_access_log VALUES (1, 'lp7s2etrfdenp6843njks56hv3', 'admin', '2021-05-18 11:25:31', '2021', '05', '18', '2021-05-18 22:19:16', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (3, '4dbjq3mdd8kndnnaflenpljs5e', 'Ana', '2021-05-18 23:19:45', '2021', '05', '18', NULL, 'N', '192.168.1.12');
INSERT INTO public.system_access_log VALUES (2, 'gnigc8e8n0hm8tut34bqgjcsdc', 'Ana', '2021-05-18 22:19:33', '2021', '05', '18', '2021-05-19 00:06:54', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (4, 't75enj1s3kasffoj7jslb9vnnm', 'admin', '2021-05-19 00:07:00', '2021', '05', '19', '2021-05-19 00:08:45', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (5, 'lhcf933mdco7v4prkmf67f0m2g', 'admin', '2021-05-19 18:43:25', '2021', '05', '19', NULL, 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (6, 'titm09lgf1ju3nvap0uc1rr1bu', 'Ana', '2021-05-20 06:18:25', '2021', '05', '20', NULL, 'N', '192.168.1.12');
INSERT INTO public.system_access_log VALUES (7, '2a31nh84e4eachk6u1ck07j9tt', 'Ana', '2021-05-20 18:44:14', '2021', '05', '20', NULL, 'N', '192.168.1.18');
INSERT INTO public.system_access_log VALUES (9, '42jbblm22li7kn63lnr29a5oi1', 'Ana', '2021-05-25 16:37:02', '2021', '05', '25', NULL, 'N', '192.168.1.12');
INSERT INTO public.system_access_log VALUES (10, 'bl4ig3ocdmkv0qubdma95d9l0f', 'Ana', '2021-05-25 16:42:45', '2021', '05', '25', NULL, 'N', '192.168.1.10');
INSERT INTO public.system_access_log VALUES (8, 'o5bolhd6phfhi2guofup1etd5a', 'admin', '2021-05-25 12:05:48', '2021', '05', '25', '2021-05-25 22:57:39', 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (11, 'b49n41blpoatlkesfj7tblj050', 'admin', '2021-05-25 22:57:47', '2021', '05', '25', NULL, 'N', '127.0.0.1');
INSERT INTO public.system_access_log VALUES (12, 'c8814df5kv823q97a83b2cuvh5', 'admin', '2021-05-25 23:51:57', '2021', '05', '25', NULL, 'N', '::1');
INSERT INTO public.system_access_log VALUES (13, 'n6b6am6q8joek5juoq71jvl7n8', 'Ana', '2021-05-26 05:33:41', '2021', '05', '26', NULL, 'N', '192.168.1.12');
INSERT INTO public.system_access_log VALUES (14, '19tshqhpj4u6riendc1qr32009', 'Ana', '2021-05-26 05:35:48', '2021', '05', '26', NULL, 'N', '192.168.1.12');
INSERT INTO public.system_access_log VALUES (15, 'g5or0pebd0p9vk1m2k305qr83v', 'Ana', '2021-05-26 13:33:41', '2021', '05', '26', NULL, 'N', '192.168.1.10');


--
-- TOC entry 3219 (class 0 OID 25162)
-- Dependencies: 206
-- Data for Name: system_change_log; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3216 (class 0 OID 25129)
-- Dependencies: 203
-- Data for Name: system_document; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3215 (class 0 OID 25121)
-- Dependencies: 202
-- Data for Name: system_document_category; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_document_category VALUES (1, 'Documentação');


--
-- TOC entry 3218 (class 0 OID 25152)
-- Dependencies: 205
-- Data for Name: system_document_group; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3217 (class 0 OID 25142)
-- Dependencies: 204
-- Data for Name: system_document_user; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3223 (class 0 OID 25194)
-- Dependencies: 210
-- Data for Name: system_group; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_group VALUES (1, 'Admin');
INSERT INTO public.system_group VALUES (2, 'Standard');


--
-- TOC entry 3230 (class 0 OID 25260)
-- Dependencies: 217
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
INSERT INTO public.system_group_program VALUES (47, 1, 44);
INSERT INTO public.system_group_program VALUES (48, 2, 44);
INSERT INTO public.system_group_program VALUES (49, 1, 45);
INSERT INTO public.system_group_program VALUES (50, 2, 45);
INSERT INTO public.system_group_program VALUES (51, 1, 46);
INSERT INTO public.system_group_program VALUES (52, 2, 46);


--
-- TOC entry 3213 (class 0 OID 25105)
-- Dependencies: 200
-- Data for Name: system_message; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3214 (class 0 OID 25113)
-- Dependencies: 201
-- Data for Name: system_notification; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3226 (class 0 OID 25209)
-- Dependencies: 213
-- Data for Name: system_preference; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3224 (class 0 OID 25199)
-- Dependencies: 211
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
INSERT INTO public.system_program VALUES (44, 'New Venda', 'NewVenda');
INSERT INTO public.system_program VALUES (45, 'Venda List', 'VendaList');
INSERT INTO public.system_program VALUES (46, 'PDFCreate', 'PDFCreate');


--
-- TOC entry 3222 (class 0 OID 25186)
-- Dependencies: 209
-- Data for Name: system_request_log; Type: TABLE DATA; Schema: public; Owner: system
--



--
-- TOC entry 3220 (class 0 OID 25170)
-- Dependencies: 207
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
INSERT INTO public.system_sql_log VALUES (37, '2021-05-25 13:03:05', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (46, ''PDFCreate'', ''PDFCreate'')', 'INSERT', '127.0.0.1', '60ad1fb99966f', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(210): Adianti\Database\TRecord->store()
#3 [internal function]: SystemProgramForm->onSave(Array)
#4 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#6 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#7 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#8 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#9 {main}', 'o5bolhd6phfhi2guofup1etd5a', 'SystemProgramForm', 'apache2handler', '60ad1fb965789', '2021', '05', '25');
INSERT INTO public.system_sql_log VALUES (38, '2021-05-25 13:03:05', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 46)', 'DELETE', '127.0.0.1', '60ad1fb99966f', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''DELETE FROM sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRepository.php(506): Adianti\Database\TTransaction::log(''DELETE FROM sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(82): Adianti\Database\TRepository->delete()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(214): SystemProgram->clearParts()
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'o5bolhd6phfhi2guofup1etd5a', 'SystemProgramForm', 'apache2handler', '60ad1fb965789', '2021', '05', '25');
INSERT INTO public.system_sql_log VALUES (39, '2021-05-25 13:03:05', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (46, 1, 51)', 'INSERT', '127.0.0.1', '60ad1fb99966f', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'o5bolhd6phfhi2guofup1etd5a', 'SystemProgramForm', 'apache2handler', '60ad1fb965789', '2021', '05', '25');
INSERT INTO public.system_sql_log VALUES (40, '2021-05-25 13:03:05', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (46, 2, 52)', 'INSERT', '127.0.0.1', '60ad1fb99966f', '#0 C:\xampp\htdocs\aquarius\lib\adianti\database\TTransaction.php(220): SystemSqlLogService->write(''INSERT INTO sys...'')
#1 C:\xampp\htdocs\aquarius\lib\adianti\database\TRecord.php(646): Adianti\Database\TTransaction::log(''INSERT INTO sys...'')
#2 C:\xampp\htdocs\aquarius\app\model\admin\SystemProgram.class.php(51): Adianti\Database\TRecord->store()
#3 C:\xampp\htdocs\aquarius\app\control\admin\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))
#4 [internal function]: SystemProgramForm->onSave(Array)
#5 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(74): call_user_func(Array, Array)
#6 C:\xampp\htdocs\aquarius\lib\adianti\control\TPage.php(228): Adianti\Control\TPage->run()
#7 C:\xampp\htdocs\aquarius\lib\adianti\core\AdiantiCoreApplication.php(82): Adianti\Control\TPage->show(Array)
#8 C:\xampp\htdocs\aquarius\engine.php(27): Adianti\Core\AdiantiCoreApplication::run(''1'')
#9 C:\xampp\htdocs\aquarius\engine.php(64): TApplication::run()
#10 {main}', 'o5bolhd6phfhi2guofup1etd5a', 'SystemProgramForm', 'apache2handler', '60ad1fb965789', '2021', '05', '25');


--
-- TOC entry 3225 (class 0 OID 25204)
-- Dependencies: 212
-- Data for Name: system_unit; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_unit VALUES (1, 'Unit A', 'unit_a');
INSERT INTO public.system_unit VALUES (2, 'Unit B', 'unit_b');


--
-- TOC entry 3227 (class 0 OID 25215)
-- Dependencies: 214
-- Data for Name: system_user; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_user VALUES (1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.net', 10, NULL, 'Y');
INSERT INTO public.system_user VALUES (2, 'User', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@user.net', 7, NULL, 'Y');
INSERT INTO public.system_user VALUES (3, 'Ana Rosa Costa Lira', 'Ana', '05634314aca96f997e9d022bc320ed8c', 'aquariusg.rapida@gmail.com', 45, 1, 'Y');


--
-- TOC entry 3229 (class 0 OID 25245)
-- Dependencies: 216
-- Data for Name: system_user_group; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_user_group VALUES (1, 1, 1);
INSERT INTO public.system_user_group VALUES (2, 2, 2);
INSERT INTO public.system_user_group VALUES (3, 1, 2);
INSERT INTO public.system_user_group VALUES (4, 3, 2);


--
-- TOC entry 3231 (class 0 OID 25275)
-- Dependencies: 218
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
-- TOC entry 3228 (class 0 OID 25230)
-- Dependencies: 215
-- Data for Name: system_user_unit; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.system_user_unit VALUES (1, 1, 1);
INSERT INTO public.system_user_unit VALUES (2, 1, 2);
INSERT INTO public.system_user_unit VALUES (3, 2, 1);
INSERT INTO public.system_user_unit VALUES (4, 2, 2);
INSERT INTO public.system_user_unit VALUES (5, 3, 1);


--
-- TOC entry 3235 (class 0 OID 25317)
-- Dependencies: 222
-- Data for Name: tamanho; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.tamanho VALUES (1, 'PP');
INSERT INTO public.tamanho VALUES (2, 'P');
INSERT INTO public.tamanho VALUES (3, 'M');
INSERT INTO public.tamanho VALUES (4, 'G');
INSERT INTO public.tamanho VALUES (5, 'GG');
INSERT INTO public.tamanho VALUES (6, 'XXG');


--
-- TOC entry 3247 (class 0 OID 33427)
-- Dependencies: 234
-- Data for Name: tipo_entrega; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.tipo_entrega VALUES (1, 'CORREIOS');
INSERT INTO public.tipo_entrega VALUES (2, 'RETIRADA');
INSERT INTO public.tipo_entrega VALUES (3, 'FRETE LOCAL');


--
-- TOC entry 3237 (class 0 OID 25326)
-- Dependencies: 224
-- Data for Name: venda_produto; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.venda_produto VALUES (129, 98, 11, 1, 27, NULL, 0, 1215, NULL);
INSERT INTO public.venda_produto VALUES (130, 98, 12, 1, 7, NULL, 0, 280, NULL);
INSERT INTO public.venda_produto VALUES (131, 98, 13, 1, 10, NULL, 0, 230, NULL);


--
-- TOC entry 3241 (class 0 OID 25347)
-- Dependencies: 228
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: system
--

INSERT INTO public.vendas VALUES (98, '2021-05-26 18:59:56', 4, '2021-05-26', NULL, NULL, 3, 1, 862.5, 0, 1, 3);


--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 225
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.clientes_id_seq', 4, true);


--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 229
-- Name: imagem_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.imagem_produto_id_seq', 2, true);


--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 232
-- Name: metodos_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.metodos_pagamento_id_seq', 2, true);


--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 219
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.produto_id_seq', 13, true);


--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 221
-- Name: tamanho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.tamanho_id_seq', 6, true);


--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_entrega_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.tipo_entrega_id_seq', 3, true);


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 223
-- Name: venda_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.venda_produto_id_seq', 131, true);


--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 227
-- Name: vendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public.vendas_id_seq', 98, true);


--
-- TOC entry 3054 (class 2606 OID 25344)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3058 (class 2606 OID 25417)
-- Name: imagem_produto imagem_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.imagem_produto
    ADD CONSTRAINT imagem_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3060 (class 2606 OID 33314)
-- Name: metodos_pagamento metodos_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.metodos_pagamento
    ADD CONSTRAINT metodos_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3048 (class 2606 OID 25312)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3021 (class 2606 OID 25185)
-- Name: system_access_log system_access_log_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_access_log
    ADD CONSTRAINT system_access_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3017 (class 2606 OID 25169)
-- Name: system_change_log system_change_log_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_change_log
    ADD CONSTRAINT system_change_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3009 (class 2606 OID 25128)
-- Name: system_document_category system_document_category_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_category
    ADD CONSTRAINT system_document_category_pkey PRIMARY KEY (id);


--
-- TOC entry 3015 (class 2606 OID 25156)
-- Name: system_document_group system_document_group_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_group
    ADD CONSTRAINT system_document_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3011 (class 2606 OID 25136)
-- Name: system_document system_document_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document
    ADD CONSTRAINT system_document_pkey PRIMARY KEY (id);


--
-- TOC entry 3013 (class 2606 OID 25146)
-- Name: system_document_user system_document_user_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_user
    ADD CONSTRAINT system_document_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3025 (class 2606 OID 25198)
-- Name: system_group system_group_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_group
    ADD CONSTRAINT system_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3042 (class 2606 OID 25264)
-- Name: system_group_program system_group_program_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_group_program
    ADD CONSTRAINT system_group_program_pkey PRIMARY KEY (id);


--
-- TOC entry 3005 (class 2606 OID 25112)
-- Name: system_message system_message_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_message
    ADD CONSTRAINT system_message_pkey PRIMARY KEY (id);


--
-- TOC entry 3007 (class 2606 OID 25120)
-- Name: system_notification system_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_notification
    ADD CONSTRAINT system_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 3027 (class 2606 OID 25203)
-- Name: system_program system_program_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_program
    ADD CONSTRAINT system_program_pkey PRIMARY KEY (id);


--
-- TOC entry 3023 (class 2606 OID 25193)
-- Name: system_request_log system_request_log_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_request_log
    ADD CONSTRAINT system_request_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3019 (class 2606 OID 25177)
-- Name: system_sql_log system_sql_log_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_sql_log
    ADD CONSTRAINT system_sql_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3029 (class 2606 OID 25208)
-- Name: system_unit system_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_unit
    ADD CONSTRAINT system_unit_pkey PRIMARY KEY (id);


--
-- TOC entry 3038 (class 2606 OID 25249)
-- Name: system_user_group system_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_group
    ADD CONSTRAINT system_user_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3032 (class 2606 OID 25219)
-- Name: system_user system_user_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user
    ADD CONSTRAINT system_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3046 (class 2606 OID 25279)
-- Name: system_user_program system_user_program_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_program
    ADD CONSTRAINT system_user_program_pkey PRIMARY KEY (id);


--
-- TOC entry 3034 (class 2606 OID 25234)
-- Name: system_user_unit system_user_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_unit
    ADD CONSTRAINT system_user_unit_pkey PRIMARY KEY (id);


--
-- TOC entry 3050 (class 2606 OID 25323)
-- Name: tamanho tamanho_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.tamanho
    ADD CONSTRAINT tamanho_pkey PRIMARY KEY (id);


--
-- TOC entry 3062 (class 2606 OID 33432)
-- Name: tipo_entrega tipo_entrega_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.tipo_entrega
    ADD CONSTRAINT tipo_entrega_pkey PRIMARY KEY (id);


--
-- TOC entry 3052 (class 2606 OID 25335)
-- Name: venda_produto venda_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3056 (class 2606 OID 25355)
-- Name: vendas vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id);


--
-- TOC entry 3039 (class 1259 OID 25294)
-- Name: sys_group_program_group_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_group_program_group_idx ON public.system_group_program USING btree (system_group_id);


--
-- TOC entry 3040 (class 1259 OID 25293)
-- Name: sys_group_program_program_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_group_program_program_idx ON public.system_group_program USING btree (system_program_id);


--
-- TOC entry 3035 (class 1259 OID 25291)
-- Name: sys_user_group_group_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_group_group_idx ON public.system_user_group USING btree (system_group_id);


--
-- TOC entry 3036 (class 1259 OID 25292)
-- Name: sys_user_group_user_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_group_user_idx ON public.system_user_group USING btree (system_user_id);


--
-- TOC entry 3030 (class 1259 OID 25290)
-- Name: sys_user_program_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_program_idx ON public.system_user USING btree (frontpage_id);


--
-- TOC entry 3043 (class 1259 OID 25295)
-- Name: sys_user_program_program_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_program_program_idx ON public.system_user_program USING btree (system_program_id);


--
-- TOC entry 3044 (class 1259 OID 25296)
-- Name: sys_user_program_user_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX sys_user_program_user_idx ON public.system_user_program USING btree (system_user_id);


--
-- TOC entry 3063 (class 2606 OID 25137)
-- Name: system_document system_document_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document
    ADD CONSTRAINT system_document_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.system_document_category(id);


--
-- TOC entry 3065 (class 2606 OID 25157)
-- Name: system_document_group system_document_group_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_group
    ADD CONSTRAINT system_document_group_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.system_document(id);


--
-- TOC entry 3064 (class 2606 OID 25147)
-- Name: system_document_user system_document_user_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_document_user
    ADD CONSTRAINT system_document_user_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.system_document(id);


--
-- TOC entry 3072 (class 2606 OID 25265)
-- Name: system_group_program system_group_program_system_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_group_program
    ADD CONSTRAINT system_group_program_system_group_id_fkey FOREIGN KEY (system_group_id) REFERENCES public.system_group(id);


--
-- TOC entry 3073 (class 2606 OID 25270)
-- Name: system_group_program system_group_program_system_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_group_program
    ADD CONSTRAINT system_group_program_system_program_id_fkey FOREIGN KEY (system_program_id) REFERENCES public.system_program(id);


--
-- TOC entry 3067 (class 2606 OID 25225)
-- Name: system_user system_user_frontpage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user
    ADD CONSTRAINT system_user_frontpage_id_fkey FOREIGN KEY (frontpage_id) REFERENCES public.system_program(id);


--
-- TOC entry 3071 (class 2606 OID 25255)
-- Name: system_user_group system_user_group_system_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_group
    ADD CONSTRAINT system_user_group_system_group_id_fkey FOREIGN KEY (system_group_id) REFERENCES public.system_group(id);


--
-- TOC entry 3070 (class 2606 OID 25250)
-- Name: system_user_group system_user_group_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_group
    ADD CONSTRAINT system_user_group_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_user(id);


--
-- TOC entry 3075 (class 2606 OID 25285)
-- Name: system_user_program system_user_program_system_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_program
    ADD CONSTRAINT system_user_program_system_program_id_fkey FOREIGN KEY (system_program_id) REFERENCES public.system_program(id);


--
-- TOC entry 3074 (class 2606 OID 25280)
-- Name: system_user_program system_user_program_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_program
    ADD CONSTRAINT system_user_program_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_user(id);


--
-- TOC entry 3066 (class 2606 OID 25220)
-- Name: system_user system_user_system_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user
    ADD CONSTRAINT system_user_system_unit_id_fkey FOREIGN KEY (system_unit_id) REFERENCES public.system_unit(id);


--
-- TOC entry 3069 (class 2606 OID 25240)
-- Name: system_user_unit system_user_unit_system_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_unit
    ADD CONSTRAINT system_user_unit_system_unit_id_fkey FOREIGN KEY (system_unit_id) REFERENCES public.system_unit(id);


--
-- TOC entry 3068 (class 2606 OID 25235)
-- Name: system_user_unit system_user_unit_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.system_user_unit
    ADD CONSTRAINT system_user_unit_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_user(id);


--
-- TOC entry 3076 (class 2606 OID 25364)
-- Name: venda_produto venda_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_fk FOREIGN KEY (id_produto) REFERENCES public.produto(id) ON DELETE SET DEFAULT;


--
-- TOC entry 3078 (class 2606 OID 25385)
-- Name: venda_produto venda_produto_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_fk_1 FOREIGN KEY (id_venda) REFERENCES public.vendas(id) ON DELETE CASCADE;


--
-- TOC entry 3077 (class 2606 OID 25374)
-- Name: venda_produto venda_produto_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_fk_2 FOREIGN KEY (id_tamanho) REFERENCES public.tamanho(id);


--
-- TOC entry 3079 (class 2606 OID 25356)
-- Name: vendas vendas_fk; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);


--
-- TOC entry 3080 (class 2606 OID 25379)
-- Name: vendas vendas_fk1; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_fk1 FOREIGN KEY (id_vendedor) REFERENCES public.system_user(id);


--
-- TOC entry 3081 (class 2606 OID 33403)
-- Name: vendas vendas_fk2; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_fk2 FOREIGN KEY (id_pagamento) REFERENCES public.metodos_pagamento(id);


--
-- TOC entry 3082 (class 2606 OID 33433)
-- Name: vendas vendas_fk3; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_fk3 FOREIGN KEY (id_tipo_entrega) REFERENCES public.tipo_entrega(id);


-- Completed on 2021-05-26 19:41:47

--
-- PostgreSQL database dump complete
--

>>>>>>> 1678fd91770bdd1ffb147101eb1b96b945e4cc03
