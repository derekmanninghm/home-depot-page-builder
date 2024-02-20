--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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
-- Name: home_depot_local_db; Type: DATABASE; Schema: -; Owner: drkmannn
--

CREATE DATABASE home_depot_local_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF8';


ALTER DATABASE home_depot_local_db OWNER TO drkmannn;

\connect home_depot_local_db

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
-- Name: home_depot_local_db; Type: DATABASE PROPERTIES; Schema: -; Owner: drkmannn
--

ALTER DATABASE home_depot_local_db SET "TimeZone" TO 'utc';


\connect home_depot_local_db

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: drkmannn
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO drkmannn;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: additional_resources; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.additional_resources (
    resource_id integer NOT NULL,
    product_id integer,
    resource_type text,
    resource_url text
);


ALTER TABLE public.additional_resources OWNER TO drkmannn;

--
-- Name: additional_resources_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.additional_resources_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.additional_resources_resource_id_seq OWNER TO drkmannn;

--
-- Name: additional_resources_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.additional_resources_resource_id_seq OWNED BY public.additional_resources.resource_id;


--
-- Name: customer_questions; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.customer_questions (
    id integer NOT NULL,
    product_id integer,
    question_content character varying,
    user_name character varying,
    question_date date,
    response_user_name character varying,
    response_content character varying,
    response_date date
);


ALTER TABLE public.customer_questions OWNER TO drkmannn;

--
-- Name: customer_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.customer_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_questions_id_seq OWNER TO drkmannn;

--
-- Name: customer_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.customer_questions_id_seq OWNED BY public.customer_questions.id;


--
-- Name: descriptions; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.descriptions (
    id integer NOT NULL,
    fact character varying,
    product_id integer
);


ALTER TABLE public.descriptions OWNER TO drkmannn;

--
-- Name: descriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.descriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.descriptions_id_seq OWNER TO drkmannn;

--
-- Name: descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.descriptions_id_seq OWNED BY public.descriptions.id;


--
-- Name: img_in_product_list; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.img_in_product_list (
    id integer NOT NULL,
    product_id integer,
    img_product_list_ref text,
    img_product_list_source text
);


ALTER TABLE public.img_in_product_list OWNER TO drkmannn;

--
-- Name: img_in_product_list_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.img_in_product_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.img_in_product_list_id_seq OWNER TO drkmannn;

--
-- Name: img_in_product_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.img_in_product_list_id_seq OWNED BY public.img_in_product_list.id;


--
-- Name: img_urls; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.img_urls (
    id integer NOT NULL,
    product_id integer,
    img_url character varying
);


ALTER TABLE public.img_urls OWNER TO drkmannn;

--
-- Name: img_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.img_urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.img_urls_id_seq OWNER TO drkmannn;

--
-- Name: img_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.img_urls_id_seq OWNED BY public.img_urls.id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.options (
    id integer NOT NULL,
    product_id integer,
    option_content character varying,
    option_pic_url character varying
);


ALTER TABLE public.options OWNER TO drkmannn;

--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.options_id_seq OWNER TO drkmannn;

--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;


--
-- Name: product_list; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.product_list (
    list_id integer NOT NULL,
    product_id integer,
    item_description text
);


ALTER TABLE public.product_list OWNER TO drkmannn;

--
-- Name: product_list_list_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.product_list_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_list_list_id_seq OWNER TO drkmannn;

--
-- Name: product_list_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.product_list_list_id_seq OWNED BY public.product_list.list_id;


--
-- Name: productdetails_images; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.productdetails_images (
    id integer NOT NULL,
    imagesrc character varying,
    alttext character varying,
    title character varying,
    detail text,
    product_id integer
);


ALTER TABLE public.productdetails_images OWNER TO drkmannn;

--
-- Name: productdetails_images_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.productdetails_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productdetails_images_id_seq OWNER TO drkmannn;

--
-- Name: productdetails_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.productdetails_images_id_seq OWNED BY public.productdetails_images.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.products (
    id integer NOT NULL,
    product_name character varying,
    manufacturer character varying,
    price numeric(10,2),
    has_warranty boolean
);


ALTER TABLE public.products OWNER TO drkmannn;

--
-- Name: products_description; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.products_description (
    id integer NOT NULL,
    product_id integer,
    description text
);


ALTER TABLE public.products_description OWNER TO drkmannn;

--
-- Name: products_description_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.products_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_description_id_seq OWNER TO drkmannn;

--
-- Name: products_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.products_description_id_seq OWNED BY public.products_description.id;


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO drkmannn;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: promotions; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.promotions (
    id integer NOT NULL,
    product_id integer,
    price_original numeric(10,2),
    price_reduced numeric(10,2)
);


ALTER TABLE public.promotions OWNER TO drkmannn;

--
-- Name: promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.promotions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promotions_id_seq OWNER TO drkmannn;

--
-- Name: promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.promotions_id_seq OWNED BY public.promotions.id;


--
-- Name: review_images; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.review_images (
    id integer NOT NULL,
    review_id integer,
    img_url character varying,
    product_id integer
);


ALTER TABLE public.review_images OWNER TO drkmannn;

--
-- Name: review_images_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.review_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_images_id_seq OWNER TO drkmannn;

--
-- Name: review_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.review_images_id_seq OWNED BY public.review_images.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    product_id integer,
    content character varying,
    reviewer_name character varying,
    rating integer,
    title text,
    review_date date,
    isrecommended boolean,
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.reviews OWNER TO drkmannn;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO drkmannn;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: specifications_details; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.specifications_details (
    id integer NOT NULL,
    battery_amp_hours integer,
    blows_per_minute integer,
    color_family character varying,
    cordless_tool_type character varying,
    drill_driver_type character varying,
    included text,
    motor_type text,
    power_tool_features text,
    returnable text,
    torque integer,
    battery_motor_type character varying,
    other_included character varying,
    condition character varying,
    is_cordless character varying,
    drive_size character varying,
    max_speed_rpm character varying,
    num_batteries_included integer,
    product_weight character varying,
    tools_product_type character varying,
    voltage character varying,
    product_id integer
);


ALTER TABLE public.specifications_details OWNER TO drkmannn;

--
-- Name: specifications_details_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.specifications_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.specifications_details_id_seq OWNER TO drkmannn;

--
-- Name: specifications_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.specifications_details_id_seq OWNED BY public.specifications_details.id;


--
-- Name: specifications_dimensions; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.specifications_dimensions (
    id integer NOT NULL,
    product_id integer,
    depth integer,
    depth_unit_of_measure character varying,
    width integer,
    width_unit_of_measure character varying,
    height integer,
    height_unit_of_measure character varying
);


ALTER TABLE public.specifications_dimensions OWNER TO drkmannn;

--
-- Name: specifications_dimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.specifications_dimensions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.specifications_dimensions_id_seq OWNER TO drkmannn;

--
-- Name: specifications_dimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.specifications_dimensions_id_seq OWNED BY public.specifications_dimensions.id;


--
-- Name: store_local; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.store_local (
    id integer NOT NULL,
    zipcode integer,
    city_name character varying,
    product_id integer,
    inventory integer
);


ALTER TABLE public.store_local OWNER TO drkmannn;

--
-- Name: store_local_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.store_local_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.store_local_id_seq OWNER TO drkmannn;

--
-- Name: store_local_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.store_local_id_seq OWNED BY public.store_local.id;


--
-- Name: store_online; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.store_online (
    id integer NOT NULL,
    product_id integer,
    inventory integer,
    days_to_ship integer
);


ALTER TABLE public.store_online OWNER TO drkmannn;

--
-- Name: store_online_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.store_online_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.store_online_id_seq OWNER TO drkmannn;

--
-- Name: store_online_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.store_online_id_seq OWNED BY public.store_online.id;


--
-- Name: warranty_certifications; Type: TABLE; Schema: public; Owner: drkmannn
--

CREATE TABLE public.warranty_certifications (
    id integer NOT NULL,
    product_id integer,
    certifications_listings character varying,
    manufacturer_warranty character varying
);


ALTER TABLE public.warranty_certifications OWNER TO drkmannn;

--
-- Name: warranty_certifications_id_seq; Type: SEQUENCE; Schema: public; Owner: drkmannn
--

CREATE SEQUENCE public.warranty_certifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.warranty_certifications_id_seq OWNER TO drkmannn;

--
-- Name: warranty_certifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drkmannn
--

ALTER SEQUENCE public.warranty_certifications_id_seq OWNED BY public.warranty_certifications.id;


--
-- Name: additional_resources resource_id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.additional_resources ALTER COLUMN resource_id SET DEFAULT nextval('public.additional_resources_resource_id_seq'::regclass);


--
-- Name: customer_questions id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.customer_questions ALTER COLUMN id SET DEFAULT nextval('public.customer_questions_id_seq'::regclass);


--
-- Name: descriptions id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.descriptions ALTER COLUMN id SET DEFAULT nextval('public.descriptions_id_seq'::regclass);


--
-- Name: img_in_product_list id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.img_in_product_list ALTER COLUMN id SET DEFAULT nextval('public.img_in_product_list_id_seq'::regclass);


--
-- Name: img_urls id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.img_urls ALTER COLUMN id SET DEFAULT nextval('public.img_urls_id_seq'::regclass);


--
-- Name: options id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);


--
-- Name: product_list list_id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.product_list ALTER COLUMN list_id SET DEFAULT nextval('public.product_list_list_id_seq'::regclass);


--
-- Name: productdetails_images id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.productdetails_images ALTER COLUMN id SET DEFAULT nextval('public.productdetails_images_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_description id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.products_description ALTER COLUMN id SET DEFAULT nextval('public.products_description_id_seq'::regclass);


--
-- Name: promotions id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.promotions ALTER COLUMN id SET DEFAULT nextval('public.promotions_id_seq'::regclass);


--
-- Name: review_images id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.review_images ALTER COLUMN id SET DEFAULT nextval('public.review_images_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: specifications_details id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.specifications_details ALTER COLUMN id SET DEFAULT nextval('public.specifications_details_id_seq'::regclass);


--
-- Name: specifications_dimensions id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.specifications_dimensions ALTER COLUMN id SET DEFAULT nextval('public.specifications_dimensions_id_seq'::regclass);


--
-- Name: store_local id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.store_local ALTER COLUMN id SET DEFAULT nextval('public.store_local_id_seq'::regclass);


--
-- Name: store_online id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.store_online ALTER COLUMN id SET DEFAULT nextval('public.store_online_id_seq'::regclass);


--
-- Name: warranty_certifications id; Type: DEFAULT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.warranty_certifications ALTER COLUMN id SET DEFAULT nextval('public.warranty_certifications_id_seq'::regclass);


--
-- Data for Name: additional_resources; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.additional_resources (resource_id, product_id, resource_type, resource_url) FROM stdin;
1	1	SDS	https://images.thdstatic.com/catalog/pdfImages/ae/ae3a45df-aa1e-4461-82c8-b611f107c6e7.pdf
2	1	Warranty	https://images.thdstatic.com/catalog/pdfImages/27/27ae821e-be9c-451d-9173-7c86a2215a19.pdf
3	1	Use and Care Manual	https://images.thdstatic.com/catalog/pdfImages/ae/ae7240ad-ba4d-4970-bf24-8ad9c67f26da.pdf
4	1	Return Policy	https://www.homedepot.com/c/Return_Policy
5	2	SDS	https://images.thdstatic.com/catalog/pdfImages/98/98f33c27-7173-4e56-805f-d4cdcef0658b.pdf
6	2	Warranty	https://images.thdstatic.com/catalog/pdfImages/1b/1b7d9033-6fc4-45ca-a39e-36f2e511b3ce.pdf
7	2	Use and Care Manual	https://example.com/manual.pdf
\.


--
-- Data for Name: customer_questions; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.customer_questions (id, product_id, question_content, user_name, question_date, response_user_name, response_content, response_date) FROM stdin;
1	1	ther is sheeping to israel ?	moche	2024-01-31	\N	\N	\N
2	1	Hello, I just wanted to be sure that the included charger can charge higher Ah battery, please verify this for me?	Frank	2024-01-12	RYOBI	Hello, Frank - Yes, the included charger can charge any size RYOBI One+ 18V battery! We hope this helps! If you need further support, then call or text us at 1.800.525.2579, Monday - Friday from 9 am to 5 pm (EST), or through email when you visit us at https://www.ryobitools.com/support/contact.	2024-01-15
3	1	Can I purchase dividers for the standard box	Jason	2023-12-31	RYOBI	Hello, Jason - Thank you for your question. Please follow these links for details on the available dividers to purchase. https://www.homedepot.com/s/LINK%20divider?NCNI-5 and https://www.homedepot.com/p/RYOBI-LINK-Single-Organizer-Bin-STM813/317939863 I hope this helps! Additionally, if you need further support, then a RYOBI Customer Experience Professional is here for you, Monday - Friday from 9 am to 6 pm (EST) when you call or text us at 1.800.525.2579 or through email when you visit us at https://www.ryobitools.com/support/contact. And thank you again for your interest in the LINK Standard Tool Box. - Joyce	2024-01-30
4	1	Are 2 of the smaller boxes locked together equal the medium size box in height ?	Joshua	2023-12-30	RYOBI	Hello, Joshua - Thank you for your question. This standard sized unit is 6.1 inches in height alone, with two of these stacked that will equal to 12.2 inches in height. One medium box has a height of 9.32 inches in height. I hope this helps! Additionally, if you need further support, then a RYOBI Customer Experience Professional is here for you, Monday - Friday from 9 am to 6 pm (EST) when you call or text us at 1.800.525.2579 or through email when you visit us at https://www.ryobitools.com/support/contact. And thank you again for your interest in the LINK Standard Tool Box. - Teyana	2023-12-21
5	1	Hello, it states you get 2 free tools but it doesn't tell which tools it is or if you get to choose 2. Thanks	Angel	2023-12-14	RYOBI	Hello, Angel - Thank you for your question. For the free tool choices, please reach out to The Home Depot to have them walk through the products with you. I hope this helps! Additionally, if you need further support, then a RYOBI Customer Experience Professional is here for you, Monday - Friday from 9 am to 6 pm (EST) when you call or text us at 1.800.525.2579 or through email when you visit us at https://www.ryobitools.com/support/contact. And thank you again for your interest in the ONE+ HP 18V Brushless Cordless 1/2 in. Drill/Driver and Impact Driver Kit w/(2) 2.0 Ah Batteries, Charger, and Bag. - Emily	2023-12-15
6	1	Are these drills compatible with the scrubber attachments?	cass	2023-12-06	RYOBI	Hello, Cass - Thank you for your question. Yes, the power scrubber attachments are compatible with this model and can be used with most of our drills and drivers. I hope this helps! Additionally, if you need further support, then a RYOBI Customer Experience Professional is here for you, Monday - Friday from 9 am to 6 pm (EST) when you call us at 1.800.525.2579 or through email when you visit us at https://www.ryobitools.com/support/contact. And thank you again for your interest in the ONE+ HP 18V Brushless Cordless 1/2 in. Drill/Driver and Impact Driver Kit w/(2) 2.0 Ah Batteries, Charger, and Bag. - Lydia	2023-12-07
7	1	I am confused. They picture shows a bag and people are talking about a toolbox. What comes with this kit? Also does this impact driver have variable speed trigger with the $199 kit? I am not seeing it in the picture.	Buckeye	2023-12-04	RYOBI	Hello, Buckeye - Thank you for your question. I apologize for the confusion. This kit comes with the 2 tools listed, (2) batteries and charger, along with a tool bag. The impact driver does have a variable speed switch trigger. I hope this helps! Additionally, if you need further support, then a RYOBI Customer Experience Professional is here for you, Monday - Friday from 9 am to 6 pm (EST) when you call or text us at 1.800.525.2579 or through email or live chat when you visit us at https://www.ryobitools.com/support/contact. And thank you again for your interest in the ONE+ HP 18V Brushless Cordless 1/2 in. Drill/Driver and Impact Driver Kit w/(2) 2.0 Ah Batteries, Charger, and Bag. - Teyana	2023-12-05
8	1	Made where	Pinoy	2023-12-03	RYOBI	Hello, Pinoy - Thank you for your question. If your unit has a "VNM" on the data label for the model number, it was created in Vietnam, however, our products are made all over the world. I hope this helps! Additionally, if you need further support, then a RYOBI Customer Experience Professional is here for you, Monday - Friday from 9 am to 6 pm (EST) when you call or text us at 1.800.525.2579 or through email or live chat when you visit us at https://www.ryobitools.com/support/contact. And thank you again for your interest in the ONE+ HP 18V Brushless Cordless 1/2 in. Drill/Driver and Impact Driver Kit w/(2) 2.0 Ah Batteries, Charger, and Bag. - Teyana	2023-12-04
39	2	Question 1: Dewalt XR Premium Lithium-Ion 5.0Ah: Pack 1: $179 is more expensive than Pack 2: $149 ? Question 2: Dewalt XR Premium Lithium-Ion 5.0Ah: Pack 1 has dimension: H 3in, W 7 in, L 7 in but Pack 2 has dimension: H 3.625 in, W 7 in, L 9.25 in. ???	phanphunghung	2023-10-23	DewaltProductExpert	Dear Valued Home Depot Customer, to better answer your question, please contact the HD.com customer service department at 800-430-3376 call any day between 6 a.m. and 2 a.m. EST, or call your local store, they can either answer your question or transfer you to your local store to answer your specific question.	2024-01-02
40	2	will this work with DCS368 brushless sawsall	bill	2023-08-05	DewaltProductExpert	Yes, the DCS368 will work with the DEWALT 20V battery line-up.	2023-10-19
41	2	Bought the DCB205 5AH for use with the chainsaw. It's never been used but a few times and won't charge past 2 bars. Highly disappointed with the cost of these batteries and basically is defective out of the package. It's a 2021 date on the battery.	upnorthwi	2023-06-30	Dewalt battery	You may have a bad battery. I had the same problem even if I charged it for long time, so I contacted www.delwalt.com service online and explained the problem. Had to take some pictures, report the number on the battery, and a copy of receipt.	2023-09-23
42	2	Do I need this to install tapcon screws	Donald	2023-05-14	DewaltProductExpert	It is not recommended to use an impact to drive Tapcon screws as the impact has a tendancy to overtighten. It is recommended to use a Hammer Drill when driving Tapcon screws.	2023-05-09
43	2	Of course recommended for DeWalt but will it also fit Black and decker 20v power tools?	Buster	2023-05-12	DewaltProductExpert	No, we recommend using BLACK+DECKER 20V batteries in your BLACK+DECKER Tools.	2024-01-24
44	2	Is this a 1/4 or 1/2?	JayMonster	2023-04-01	DewaltProductExpert	Model DCF850P1 is an Atomic 20V MAX* 1/4 in Brushless Cordless 3-Speed Impact Driver	2023-04-04
45	2	Can't find a model number on this. Is the 20v 5aH MAX XR Premium the same as the 20v 5aH MAX XR?	Trimbaton774	2022-12-30	Slappy	There's three sets of numbers on the top of the battery they are as follows but I don't know which ones are the actual model numbers but here they are: 2019 45-49 7-2 ;  N552470 L074ZIQ Also , I can send you a picture 	2022-12-30
46	2	What battery works best for the router	Mark	2023-01-01	Gman	Good morning, The Dewalt 5amp, 20-volt battery system is ideal for router edging etc. realize that any deep mortising for an extended period will deplete the charge quickly so having a backup battery or two will cut down on standby time. Don't let the charge level get too low, it will shorten the battery life. Hope this helps, G	2023-10-30
\.


--
-- Data for Name: descriptions; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.descriptions (id, fact, product_id) FROM stdin;
1	Up to 25% Faster Driving and Up to 50% More Torque	1
2	Includes: (2) 2.0 Ah High Performance Batteries, Charger, and Bag	1
3	Over 300 ONE+ Products - All Work With Any RYOBI ONE+ 18V Battery	1
17	1825 in lbs. Torque and 3250 RPM for professional performance	2
18	Compact design at 3.97” tool length	2
19	Includes (1) 20-Volt MAX XR Battery 5.0Ah	2
\.


--
-- Data for Name: img_in_product_list; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.img_in_product_list (id, product_id, img_product_list_ref, img_product_list_source) FROM stdin;
1	1	https://www.homedepot.com/collection/Hardware/RYOBI-LINK-Modular-Storage/Family-319189263?omsid=317939878" target="_blank	https://inlinecontent.thdstatic.com/25T/ONE WORLD TECHNOLOGIES I/RYOBILINK.jpg
2	1	https://www.homedepot.com/b/RYOBI/N-5yc1vZm5d?NCNI-5&amp;searchRedirect=RYOBI&amp;semanticToken=300r10r00122002000_202110251835449027801639212_us-east1-lnkk%20300r10r00122002000%20%3E%20%20st%3A%7Bryobi%7D%3Ast%20tgr%3A%7BNo%20stage%20info%7D%20qu%3A%7Bryobi%7D%3Aqu" target="_blank	https://inlinecontent.thdstatic.com/25H/ONE WORLD TECHNOLOGIES I/2731695.jpg
\.


--
-- Data for Name: img_urls; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.img_urls (id, product_id, img_url) FROM stdin;
1	1	a4958ad4-60c8-411b-bad0-49b536a543d6/svn/ryobi-impact-drivers-pblck01k-64_
2	1	8ec5ef3f-1d32-4c18-92b6-2d05769867c5/svn/ryobi-impact-drivers-pblck01k-1d_
3	1	0374fc0b-bb15-419a-bc71-2afc8ca7a13a/svn/ryobi-impact-drivers-pblck01k-66_
4	1	6840b528-3d1d-4723-9f62-fd76acb3639e/svn/ryobi-impact-drivers-pblck01k-77_
5	1	2ef8951b-3c2d-42f0-821b-47076b8dfae9/svn/ryobi-impact-drivers-pblck01k-c3_
6	1	b73dc56e-865b-496a-bc6b-c2a30565a55e/svn/ryobi-impact-drivers-pblck01k-4f_
7	1	15506711-b77e-4331-8caf-a45fcf4b00f2/svn/ryobi-impact-drivers-pblck01k-1f_
8	1	ef08a851-4f41-43ab-b492-b15ccf2d1176/svn/ryobi-impact-drivers-pblck01k-44_
9	1	d502c0de-1433-4375-b6f5-1a0bfbfeb0a3/svn/ryobi-impact-drivers-pblck01k-fa_
10	1	0c9c7c6f-e10b-41a8-9b9d-6c81af3bcbc0/svn/ryobi-impact-drivers-pblck01k-d4_
11	1	dc8bf0aa-2019-4f8c-91d2-b4a5b66bb7a3/svn/ryobi-impact-drivers-pblck01k-31_
12	1	3ddff655-5af5-4976-8892-50fcc34823eb/svn/ryobi-impact-drivers-pblck01k-de_
65	2	0ddcc6a2-169e-4de4-9e6b-4138f1ed4e3f/svn/dewalt-impact-drivers-dcf850p1-64_
66	2	e6c4433c-2642-4708-9bec-772e87fcbabd/svn/dewalt-impact-drivers-dcf850p1-e1_
67	2	a64e8883-1062-4e74-b7d2-ab013002be64/svn/dewalt-impact-drivers-dcf850p1-40_
68	2	8c3f0e7f-772c-4b50-9390-045fd2a82306/svn/dewalt-impact-drivers-dcf850p1-1d_
69	2	10f3de09-c3f4-48de-9cea-36f975e97f7d/svn/dewalt-impact-drivers-dcf850p1-66_
70	2	063b0cea-0983-4b3a-b70d-3837a31491eb/svn/dewalt-impact-drivers-dcf850p1-77_
71	2	0cf98424-2761-4cbd-8e58-1cb2a30fa9ec/svn/dewalt-impact-drivers-dcf850p1-c3_
72	2	f03122e3-ea3f-4640-bf5f-5f93a27be5f5/svn/dewalt-impact-drivers-dcf850p1-4f_
73	2	9054a040-46fc-4caa-9bab-f141615cf6b3/svn/dewalt-impact-drivers-dcf850p1-1f_
74	2	450a5dc5-d96b-4a05-b09a-3509b5e2a2ce/svn/dewalt-impact-drivers-dcf850p1-44_
75	2	a37d35e8-83b4-4e3f-8c3d-a709043f7fd7/svn/dewalt-impact-drivers-dcf850p1-fa_
76	2	aea8f6fe-3274-4e16-8c92-845c95dde886/svn/dewalt-impact-drivers-dcf850p1-76_
77	2	d1178ac5-072a-4db7-982f-3fdeb84af12a/svn/dewalt-impact-drivers-dcf850p1-d4_
\.


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.options (id, product_id, option_content, option_pic_url) FROM stdin;
\.


--
-- Data for Name: product_list; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.product_list (list_id, product_id, item_description) FROM stdin;
1	1	Brushless Motor provides longer runtime, longer motor life, and more power
2	1	Drill/Driver: Brushless motor provides up to 20% faster drilling and up to 750 in./lbs. of torque
3	1	Drill/Driver: 2-speed gearbox for ultimate user control provides 0 - 500 / 0 - 2,100 RPM
4	1	Drill/Driver: 24-position clutch allows users to adjust to desired torque setting when driving a variety of fasteners
5	1	Drill/Driver: 1/2 in. ratcheting metal chuck for increased durability
6	1	Drill/Driver: On-board LED worklight illuminates workspace for clear drilling visibility
7	1	Impact Driver: Brushless motor delivers up to 25% faster driving and up to 2,200 in./lbs. of torque
8	1	Impact Driver: Optimized impacting mechanism delivers up to 4,000 IPM
9	1	Impact Driver: Variable speed trigger provides up to 2,900 RPM
10	1	Impact Driver: Die-cast gear case for maximum durability
11	1	Impact Driver: One-handed bit release for quick bit changes
12	1	Impact Driver: On-board LED worklight illuminates workspace for clear drilling visibility
13	1	Part of the RYOBI 18V ONE+ System of Over 300 Cordless Products
14	1	3-year manufacturer's warranty
15	1	Includes: (1) PBLDD01 18V ONE+ HP Brushless 1/2 in. Drill/Driver, (1) PBLID01 18V ONE+ HP Brushless 1/4 in. Impact Driver, (2) PBP003 18V ONE+ HP 2.0 Ah High-Performance batteries, charger, tool bag, and operator's manuals
16	2	XR lithium-ion batteries with fuel gauge provide 33% more capacity over standard battery packs
17	2	Compact (6.9 in. front to back), lightweight drill/driver (3.4 lbs.) design fits into tight areas
18	2	High-speed transmission with 2-speed settings (0 RPM to 550 RPM/0 RPM to 2,000 RPM) delivers up to 30% faster application speeds
19	2	Ergonomic comfort grip handle provides ideal balance and tool control
20	2	Metal 1/2 in. ratcheting chuck for superior bit gripping strength
21	2	3-mode LED provides lighting in dark or confined spaces up to 20X brighter than the previous model
22	2	LED spotlight mode features a 20-minute shutoff function allowing for extended work time in dark or confined spaces
\.


--
-- Data for Name: productdetails_images; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.productdetails_images (id, imagesrc, alttext, title, detail, product_id) FROM stdin;
1	https://cdn.jet-cdn.com/s3/csp/1665754974615/314109290-POD1.jpg	RYOBI Tools	RYOBI Tools	RYOBI gives you the ultimate in cordless versatility, selection, and innovation to get the job done. No matter your interests or skill level, RYOBI can power it	1
2	https://cdn.jet-cdn.com/s3/csp/1665754975484/314109290-POD2.jpg	ONE+ HP	ONE+ HP	The 18V ONE+ HP Brushless series utilizes Advanced Technologies and Superior Ergonomics to deliver High Performance tools and a premium user experience	1
3	https://cdn.jet-cdn.com/s3/csp/1665754975494/314109290-POD3.jpg	Premium Performance	Premium Performance	All tools in the ONE+ HP series feature a brushless motor, advanced electronics, and lithium-ion batteries to deliver more power, longer runtime, and longer motor life	1
4	https://cdn.jet-cdn.com/s3/csp/1665754975591/314109290-POD4.jpg	Brushless Motor	Brushless Motor	Provides maximum power, extended runtime, and longer motor life	1
21	https://cdn.jet-cdn.com/s3/csp/1638280215337/DCF850P1_NA_EN_THD_Pod_1.jpg	DEWALT Guaranteed Tough	DEWALT Guaranteed Tough	DEWALT continues to design and optimize professional jobsite solutions for the toughest jobsite conditions.	2
22	https://cdn.jet-cdn.com/s3/csp/1638280213925/DCF850B_NA_EN_THD_Pod_2.jpg	Brushless Motor	Brushless Motor	DEWALT brushless motor delivers up to 57% more run time over brushed.	2
23	https://cdn.jet-cdn.com/s3/csp/1638280202470/Atomic_POD_3.jpg	Where Size Meets Power	Where Size Meets Power	Exceptional 20 VOLT power now comes in a lighter, smaller package with the DEWALT Atomic compact series.	2
24	https://cdn.jet-cdn.com/s3/csp/1638280214173/DCF850B_NA_EN_THD_Pod_4.jpg	29% Shorter	29% Shorter	Only 3.97 in. length which is a 29% shorter tool head from front to back vs. DCF885 Impact Driver.	2
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.products (id, product_name, manufacturer, price, has_warranty) FROM stdin;
1	ONE+ HP 18V Brushless Cordless 1/2 in. Drill/Driver and Impact Driver Kit w/(2) 2.0 Ah Batteries, Charger, and Bag	RYOBI	179.00	f
2	ATOMIC 20V MAX Lithium-Ion Cordless 1/4 in. Brushless Impact Driver Kit, 5 Ah Battery, Charger, and Bag	DEWALT	169.00	f
\.


--
-- Data for Name: products_description; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.products_description (id, product_id, description) FROM stdin;
1	1	The RYOBI 18V ONE+ HP Brushless line of products is redefining power and performance. The RYOBI 18V ONE+ HP Brushless 2-Tool Combo Kit includes a 1/2 in. Drill/Driver, 1/4 in. Impact Driver, (2) 18V 2.0 Ah High-Performance batteries, charger, and tool bag. The 1/2 in. Drill/Driver features a brushless motor, delivering up to 20% faster drilling and up to 50% more torque, saving time and energy per application. Its 750 in./lbs. of torque maximizes output power when drilling through tough materials. This drill includes a two-speed gearbox (0-500 and 0-2,100 RPM) and a 24-position clutch for ultimate control, and is paired with a 1/2 in. ratcheting metal chuck for increased durability and accessory retention during heavy-duty applications. The 1/4 in. Impact Driver features a brushless motor delivering up to 25% faster driving. The brushless motor delivers up to 2,200 in./lbs. of torque, providing this tool the power to drive longer fasteners through tough materials. It features one-handed bit release for quick bit changes and the on-board LED work light ensures your workspace is always illuminated. Best of all, it is part of the RYOBI ONE+ System of over 300 Cordless Products that all work on the same battery platform. This 2-Tool Combo Kit is backed by the RYOBI 3-Year Manufacturer's Warranty and includes an 18V ONE+ HP Brushless 1/2 in. Drill/Driver, an 18V ONE+ HP Brushless 1/4 in. Impact Driver, (2) 18V 2.0 Ah High-Performance Batteries, charger, bag, and operator's manuals.
2	2	The DEWALT DCD791P1 Cordless Drill Driver Set is ideal for most drilling and fastening applications on the jobsite or home. This power drill features a DEWALT Brushless Motor that delivers up to 57% more run time over brushed power tools. The 3-mode LED light is 20x brighter than previous cordless drill models to help illuminate dark work spaces. The DCD791P1 Cordless Drill/Driver Kit includes a tool bag, battery pack, and charger.
\.


--
-- Data for Name: promotions; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.promotions (id, product_id, price_original, price_reduced) FROM stdin;
1	1	199.00	179.00
6	2	219.00	169.00
\.


--
-- Data for Name: review_images; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.review_images (id, review_id, img_url, product_id) FROM stdin;
1	1	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/ac3eddff-13c3-5215-93d1-627a68e5670f	2
2	1	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/297cb5b2-7698-5e9c-ac1f-47f63de92db7	2
3	1	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/878bca29-ddb4-5db9-854a-2cb9532dd054	2
4	1	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/c4a9ae2b-0a48-53cf-a307-121ea0c9b44d	2
5	2	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/703c82d0-17c3-59f8-b2b1-b9b21ebaf10d	2
6	2	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/2b998987-6b49-58bf-ae51-255a68be412b	2
7	2	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/2b998987-6b49-58bf-ae51-255a68be412b	2
8	2	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/93c59c2f-343f-5660-a8b6-c81e26d0aa7a	2
9	3	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/ac3eddff-13c3-5215-93d1-627a68e5670f	2
10	3	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/297cb5b2-7698-5e9c-ac1f-47f63de92db7	2
11	3	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/4c1006ff-737b-5b14-8c6d-eeb486d7b1c2	2
12	4	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/6b5fa244-0497-5642-8be1-c0c0f42ba5f4	2
13	4	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/4722a60e-fb3a-544b-a8fd-5ffaf8e95e5c	2
14	4	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/b2ffbed6-1d1d-50a3-87b9-620a0dd2df4e	2
15	5	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/62ca989c-02e4-5ae4-9fef-c78de93d3eae	2
16	5	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/24e6cbde-5dc7-5d64-a0f9-9d475eaace9c	2
17	5	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/99796027-11be-5748-b5d7-6f8c74112511	2
18	6	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/8a833484-4d6d-5372-8185-5bd6dfc7942b	2
19	6	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/c6eee920-2f20-5336-967e-3ae956e53bcd	2
20	6	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/d50032b3-6da6-5749-98b0-674a020bd280	2
21	7	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/a05b458f-54f5-5ad1-8639-7ac6d4a14098	2
22	7	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/3cac0e28-a1d4-58ae-b999-08a38e9420ea	2
23	8	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/495adebe-e387-53e8-809b-25d6465a48ee	2
24	8	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/fe3a558a-db8b-5170-9a7b-80a4b23d4a18	2
25	8	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/df4a0e39-d3a9-58c9-b261-4d0a9fa81b79	2
26	9	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/2475d310-2635-55e5-9d51-7f73b9b7b2f8	2
27	9	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/468fa07e-9ddd-561c-8a9c-be0341e72dc6	2
28	10	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/48c62ed6-f77b-5b61-9a2c-fbb5cb2989b6	2
29	10	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/0a957780-af98-5da2-91ce-2674d6298c67	2
30	10	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86ZGV3YWx0/202fe5b2-285a-5fe4-b21e-b0c088ef2f3b	2
31	1	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/d453da74-d39e-5dd7-a6cd-cfa7663adda9	1
32	1	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/83e31712-dd37-5758-9b5b-fb0b0c975a4f	1
33	2	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/1a43ad26-b59b-5b5a-869c-ad192a572904	1
34	3	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/f6ff6f43-f4b1-5ac6-898c-2f47277417c7	1
35	3	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/845bed0e-6999-5643-8b58-250caedeb430	1
36	3	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/1cb787ba-6a8b-5f09-9132-3374399e7081	1
37	4	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86aG9tZWRlcG90/c35a7ff4-411d-5e46-b1b9-02a97332c8ee	1
38	5	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/b0d21583-97af-5449-97af-53532bcb11d8	1
39	6	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/92228bc7-6429-5915-ab3d-60701555ebfd	1
40	6	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/627fb2fa-8e17-5eb5-ac18-9724409d04c5	1
41	7	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86aG9tZWRlcG90/b97a385f-73cf-5b11-ae24-639fd9e38087	1
42	7	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86aG9tZWRlcG90/aba1858b-8332-5680-a61a-874241bb2a34	1
43	7	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86aG9tZWRlcG90/fbbb1fe2-9223-5ac8-9917-a434dd774202	1
44	8	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/31bf8243-f64a-5a59-8d7e-b8f91d5bb026	1
45	9	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/1d75fc6d-1f13-5b63-b4e2-e2ba52ae8412	1
46	9	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/f5c41e6b-fef6-53ce-942a-ae9adc6e27ae	1
47	9	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/f49b090a-8ad0-55be-90ad-47c1b0f9c532	1
48	9	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/c64b5669-60cd-57eb-8f64-3e44a30425fa	1
49	10	https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cnlvYmlvdXRkb29ydG9vbHM/9e64e96b-b10f-57b7-911b-381c60a66f72	1
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.reviews (id, product_id, content, reviewer_name, rating, title, review_date, isrecommended) FROM stdin;
1	1	This review was collected as part of a promotion. Used these for about a year now. I'm surprised it's asking for a review now. But I love both of these drills. The HP line is competitive with all the others. And ps, same parent company as Milwaukee. And it shows. These tools hold up fine for what we do. Paired with the 4&6 AH HP batteries they are great. Full time residential contractor with some commercial mixed it. Treat your tools with respect and they'll last you forever.	SuperWeb	5	Works great.	2024-01-13	t
2	1	This review was collected as part of a promotion. One of the finest product I ever had. Super happy with it and this is the sixth Ryobi tool that I own within an year.	millin	5	Great  tool and very efficient	2023-12-28	t
3	1	This review was collected as part of a promotion. I purchased this product to kick-start my home tool collection. Being able to get two free tools as a part of the sale for this product, along with the drill and impact driver, two 2 aH HP batteries, a carrying case, and a charger was a perfect way to do that. Ryobi is a tried a true brand that cares about keeping the interoperability of their products and batteries, while also developing their kind of products with improvements such as the introduction of brushless motors and new battery tech. I cannot recommend Ryobi enough, their products are used by millions for projects of all sizes.	BradlsRad	5	Great company, great product, great performance.	2023-12-25	t
4	1	Having trouble with the charger. Blinking green and red otherwise great deal with the 2 free tools	Jim	4	\N	2023-12-25	t
5	1	This review was collected as part of a promotion. I've been almost exclusively using Ryobi tools since I got started in construction in 2017. The portability v power output is just perfect for my needs. I'm a handy man for multiple properties and Ryobi does the job, every time.	Superfungi	5	Excellent tools	2023-12-25	t
6	1	This review was collected as part of a promotion.] Bought this with two free tools, I couldnt resist. Coming from the brushed impact and drill, Hp brushless has so much power in a compact size. Driving screws is so much faster with ease. Drilling holes also much quicker, I do mix a ton of drywall mud, drill does it effortlessly and it can get too wild on speed 2 full trigger. Amazing quality, definitely a bigger upgrade from the brushed models.	Ramby	5	Amazing Value	2023-12-08	t
7	1	I had a problem with the tale gate of my truck coming off the highway and my link tool box fell out and was run over by at car behind me and the drill and battery's that I had inside weren't damaged in any way Wow.	Jason	5	This is tuff stuff	2023-11-05	t
8	1	This review was collected as part of a promotion. Added this to my One+ Stapler, to keep battery packs interchangeable, and to replace a failed Craftsman drill. Nice quality and I appreciate built-in area light.	Anonymous	5	More Ryobi for Me	2023-08-17	t
9	1	This review was collected as part of a promotion. Wow just wow. I am in love with my new Impact Driver and Hammer Drill. The brushless motor gives them more power, runtime, and they are quieter than my brushed ones. This combo comes with two 2ah High Performance batteries, charger, and a tool bag. The HP batteries last longer and produce more power. This is a great bang for your buck.	Slappy	5	The Best Hammer Drill and Impact Driver out there!	2023-06-09	t
10	1	This review was collected as part of a promotion. I've bought these drills and love it. Easy to use and charges fast.	Kids table	5	Great drill	2023-02-09	t
45	2	[This review was collected as part of a promotion.] So I finally am replacing my old DeWalt 1/4 impact driver. This driver did not disappoint it's smaller lighter and came with a bigger battery! This atomic compact series packs a big punch I was hesitant to replace my old faithful impact but I am amazed with the quality DeWalt continues to produce in smaller package! Feels great in your hands and I liked that it came with the 5ah battery.	fernie619	5	Atomic 20v 1/4" impact packs a punch!	2024-01-03	t
46	2	[This review was collected as part of a promotion.] Impressive power in a compact design. Serious compact driver that has plenty of speed and power to handle simple driving of 1 1/4” screws to driving 4” lag screws. Compact design allows for easy maneuverability inside cabinets. Lightweight even with the 5.0 battery installed. The different speeds allow for multiple uses out of one driver. If you need heavy torque or want to finesse a screw without stripping or breaking the screw this driver has you covered with a simple push of a button. Well balanced, compact, powerful, different torque speeds, all combined make this an ideal driver to have in your toolbox	Grant8	5	Serious compact power	2023-01-02	t
47	2	[This review was collected as part of a promotion.] Love this impact driver. I was skeptical about the atomic line of dewalt but this impact driver changed that. Has power that embarrasses my current dewalt impact driver. Lights are super bright. battery has power for days. Super light weight and compact	J Brownell	5	This tool changed my mind about the atomic line	2023-12-28	t
48	2	[This review was collected as part of a promotion.] I absolutely loved using my new DeWalt Impact Drill. It's light, well balanced and plenty of power. I used this drill on all my new garage shelving and it still had plenty of battery after I was done.	Bill G	5	Atomic 20V max impact drill	2023-12-23	t
49	2	[This review was collected as part of a promotion.] I have actively used the Atomic 20V MAX* 1/4 impact driver for the past few weeks, and really put it through the ringer....it came through like a champ each time. You can really notice a difference in the 3 speed function as well. Over the years I have used a wide variety of drivers and many times you can't feel, let alone hear, much of a difference; with this Atomic driver you can. Not only is the a noticeable difference going from speed to speed, I also really like the sensitive nature of the trigger. I like the compact nature of it of course, I would only recommend that it is sold with a power stack battery. The compact, yet powerful nature of those two products combined is amazing.	Bwagner	5	Big power, little frame	2023-12-25	t
50	2	[This review was collected as part of a promotion.] Great drill for tight spaces. I use this impact while working on RVs and couldn’t be more impressed. Inside of cabinets working on furnaces or water heaters this gun with three speed settings get it done. My new favorite Dewalt tool.	DWillDuck13	5	High performance in a small impact.	2022-12-20	t
51	2	[This review was collected as part of a promotion.] There is impressive power packed into this Atomic ¼ in Impact Driver. This compact driver has three power settings to vary the output power from precision tasks to 1,825 in-lbs (or about 152 ft-lbs torque). LED lights are in the perfect position to see your work in tight spaces and bright enough to use as a flashlight searching through a tool bin. This impact driver has the quality you come to love about DeWalt tools, torque you can feel, and doesn’t take much real estate in a tool bag. The perfect addition to my garage tool bag since I leave its high-torque big brother with the truck tools.	Dustin	5	Huge Power in Compact Driver	2022-12-17	t
52	2	[This review was collected as part of a promotion.] Pros: ~ Fantastic kit - perfect for DIYers or professionals alike. ~ Compact and lightweight ~ Excellent ergonomics ~ Well built and exceptional quality Cons: ~ Not worth the upgrade if you don't need the drive's space saving design. Overall: If this would be your first impact driver then look no further. Excellent build quality, power, and comfort. This kit also includes all the essentials to get started right away. Review: The DCF850 is a step-up compared to the DCF887 even though they have the same specs. (3 speed, 0-3800 impacts per minute, 20V) This kit comes with the ¼” impact driver, 5Ah battery, charger, toolbag, and belt clip. For me, as a DIYer, it's all about the comfort and long-term use. When you hold the 850, it feels much less awkward compared to the 887. The 850 feels much more balanced due to its significantly shorter design. In pictures, it might not seem like that big of a deal to some but when space is needed, it's a fantastic option! Prior to owning the 850, I had read a couple reviews stating that the 887 did a better job with certain screws (headlok, deck, etc..). This was not the case for myself, however. With the included 5Ah battery in this kit, it was just as forceful, if not moreso, than the 887. If you are torn between the two choices, without a doubt go with the 850. You aren't sacrificing power, the available space in tight spots is increased, comfortability is fantastic, and the durability is top notch.	Wombat	5	Fantastic Driver in a Great Kit!	2022-12-15	t
53	2	[This review was collected as part of a promotion.] I loved the small head, which allowed us to install screws in a tight location. I used it myself, and let some fellow workers try it out. One of the guys who loves another brand, admitted that he liked this driver. The torque is amazing for a small motor. The bright light ring is also helpful. Very satisfied, with the improvements.	mtrbldr	5	Fits in tight spaces didn't sacrifice performance	2022-12-14	t
54	2	[This review was collected as part of a promotion.] I received the Atomic 20V MAX* 1/4 in. Brushless Cordless 3-Speed Impact Driver Kit and have been using it almost daily. I use the impact driver for both drilling and screwing all types of screws and snap in a socket driver to insert and remove hex bolts and nuts quite often. My favorite enhancement to the now past model is the new 3 speed options. I now feel I have more control over the use of screws in that the speed is tempered. The brushless motor is so very smooth I can hardly imagine a better tool anywhere on the market. It also seems like the 3 LED lights are very bright as compared to the regular impact driver.	Slayyypy	5	Awesome defines DeWalt's 3 speed impact driver	2022-12-14	t
\.


--
-- Data for Name: specifications_details; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.specifications_details (id, battery_amp_hours, blows_per_minute, color_family, cordless_tool_type, drill_driver_type, included, motor_type, power_tool_features, returnable, torque, battery_motor_type, other_included, condition, is_cordless, drive_size, max_speed_rpm, num_batteries_included, product_weight, tools_product_type, voltage, product_id) FROM stdin;
1	2	24000	Green	Impact Driver	Impact Driver	Tool Bag	Brushless	No Additional Features	90-day	650	Lithium-ion	Charger included	New	Cordless	1/4 In. Hex	2100 RPM	2	3.1 lb	Power Tool	18 V	1
6	5	3800	Yellow	Impact Driver	Impact Driver	Tool Bag	Brushless	LED Light, Variable Speed	90-day	1825	Lithium-ion	Charger included	New	Cordless	1/4 In. Hex	3250 RPM	1	4.45 lb	Power Tool	20 V	2
\.


--
-- Data for Name: specifications_dimensions; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.specifications_dimensions (id, product_id, depth, depth_unit_of_measure, width, width_unit_of_measure, height, height_unit_of_measure) FROM stdin;
1	1	8	in	3	in	8	in
6	2	13	in	10	in	4	in
\.


--
-- Data for Name: store_local; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.store_local (id, zipcode, city_name, product_id, inventory) FROM stdin;
1	91945	Lemon Grove	1	29
3	91945	Lemon Grove	2	0
4	91945	Lemon Grove	2	0
5	91945	Lemon Grove	2	0
6	91945	Lemon Grove	2	0
\.


--
-- Data for Name: store_online; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.store_online (id, product_id, inventory, days_to_ship) FROM stdin;
1	1	1002	1
6	2	421	3
\.


--
-- Data for Name: warranty_certifications; Type: TABLE DATA; Schema: public; Owner: drkmannn
--

COPY public.warranty_certifications (id, product_id, certifications_listings, manufacturer_warranty) FROM stdin;
1	1	UL Listed	3-Year Manufacturer's Warranty
3	2	CSA Listed	3 Year Limited Warranty, 1 Year Warranty, 90 Day Money Back Guarantee
\.


--
-- Name: additional_resources_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.additional_resources_resource_id_seq', 7, true);


--
-- Name: customer_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.customer_questions_id_seq', 46, true);


--
-- Name: descriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.descriptions_id_seq', 19, true);


--
-- Name: img_in_product_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.img_in_product_list_id_seq', 2, true);


--
-- Name: img_urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.img_urls_id_seq', 77, true);


--
-- Name: options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.options_id_seq', 1, false);


--
-- Name: product_list_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.product_list_list_id_seq', 22, true);


--
-- Name: productdetails_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.productdetails_images_id_seq', 24, true);


--
-- Name: products_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.products_description_id_seq', 2, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.promotions_id_seq', 6, true);


--
-- Name: review_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.review_images_id_seq', 49, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.reviews_id_seq', 54, true);


--
-- Name: specifications_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.specifications_details_id_seq', 6, true);


--
-- Name: specifications_dimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.specifications_dimensions_id_seq', 6, true);


--
-- Name: store_local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.store_local_id_seq', 6, true);


--
-- Name: store_online_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.store_online_id_seq', 6, true);


--
-- Name: warranty_certifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drkmannn
--

SELECT pg_catalog.setval('public.warranty_certifications_id_seq', 6, true);


--
-- Name: additional_resources additional_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.additional_resources
    ADD CONSTRAINT additional_resources_pkey PRIMARY KEY (resource_id);


--
-- Name: customer_questions customer_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.customer_questions
    ADD CONSTRAINT customer_questions_pkey PRIMARY KEY (id);


--
-- Name: descriptions descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_pkey PRIMARY KEY (id);


--
-- Name: img_in_product_list img_in_product_list_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.img_in_product_list
    ADD CONSTRAINT img_in_product_list_pkey PRIMARY KEY (id);


--
-- Name: img_urls img_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.img_urls
    ADD CONSTRAINT img_urls_pkey PRIMARY KEY (id);


--
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: product_list product_list_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.product_list
    ADD CONSTRAINT product_list_pkey PRIMARY KEY (list_id);


--
-- Name: productdetails_images productdetails_images_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.productdetails_images
    ADD CONSTRAINT productdetails_images_pkey PRIMARY KEY (id);


--
-- Name: products_description products_description_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.products_description
    ADD CONSTRAINT products_description_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: promotions promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_pkey PRIMARY KEY (id);


--
-- Name: review_images review_images_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.review_images
    ADD CONSTRAINT review_images_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: specifications_details specifications_details_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.specifications_details
    ADD CONSTRAINT specifications_details_pkey PRIMARY KEY (id);


--
-- Name: specifications_dimensions specifications_dimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.specifications_dimensions
    ADD CONSTRAINT specifications_dimensions_pkey PRIMARY KEY (id);


--
-- Name: store_local store_local_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.store_local
    ADD CONSTRAINT store_local_pkey PRIMARY KEY (id);


--
-- Name: store_online store_online_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.store_online
    ADD CONSTRAINT store_online_pkey PRIMARY KEY (id);


--
-- Name: warranty_certifications warranty_certifications_pkey; Type: CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.warranty_certifications
    ADD CONSTRAINT warranty_certifications_pkey PRIMARY KEY (id);


--
-- Name: additional_resources additional_resources_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.additional_resources
    ADD CONSTRAINT additional_resources_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: customer_questions customer_questions_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.customer_questions
    ADD CONSTRAINT customer_questions_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: descriptions descriptions_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: img_in_product_list img_in_product_list_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.img_in_product_list
    ADD CONSTRAINT img_in_product_list_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: img_urls img_urls_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.img_urls
    ADD CONSTRAINT img_urls_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: options options_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: product_list product_list_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.product_list
    ADD CONSTRAINT product_list_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: productdetails_images productdetails_images_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.productdetails_images
    ADD CONSTRAINT productdetails_images_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: products_description products_description_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.products_description
    ADD CONSTRAINT products_description_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: promotions promotions_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: review_images review_images_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.review_images
    ADD CONSTRAINT review_images_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: review_images review_images_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.review_images
    ADD CONSTRAINT review_images_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(id);


--
-- Name: reviews reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: specifications_details specifications_details_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.specifications_details
    ADD CONSTRAINT specifications_details_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: specifications_dimensions specifications_dimensions_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.specifications_dimensions
    ADD CONSTRAINT specifications_dimensions_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: store_local store_local_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.store_local
    ADD CONSTRAINT store_local_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: store_online store_online_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.store_online
    ADD CONSTRAINT store_online_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: warranty_certifications warranty_certifications_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drkmannn
--

ALTER TABLE ONLY public.warranty_certifications
    ADD CONSTRAINT warranty_certifications_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO drkmannn;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO drkmannn;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO drkmannn;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO drkmannn;


--
-- PostgreSQL database dump complete
--

