--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0 (Debian 14.0-1.pgdg110+1)
-- Dumped by pg_dump version 14.0 (Debian 14.0-1.pgdg110+1)

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

SET default_table_access_method = heap;

--
-- Name: constraints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constraints (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    segment_id integer,
    property text,
    operator text,
    value text
);


ALTER TABLE public.constraints OWNER TO postgres;

--
-- Name: constraints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.constraints_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constraints_id_seq OWNER TO postgres;

--
-- Name: constraints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.constraints_id_seq OWNED BY public.constraints.id;


--
-- Name: distributions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.distributions (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    segment_id integer,
    variant_id integer,
    variant_key text,
    percent integer,
    bitmap text
);


ALTER TABLE public.distributions OWNER TO postgres;

--
-- Name: distributions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.distributions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distributions_id_seq OWNER TO postgres;

--
-- Name: distributions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.distributions_id_seq OWNED BY public.distributions.id;


--
-- Name: flag_entity_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flag_entity_types (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    key character varying(64)
);


ALTER TABLE public.flag_entity_types OWNER TO postgres;

--
-- Name: flag_entity_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flag_entity_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flag_entity_types_id_seq OWNER TO postgres;

--
-- Name: flag_entity_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flag_entity_types_id_seq OWNED BY public.flag_entity_types.id;


--
-- Name: flag_snapshots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flag_snapshots (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    flag_id integer,
    updated_by text,
    flag text
);


ALTER TABLE public.flag_snapshots OWNER TO postgres;

--
-- Name: flag_snapshots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flag_snapshots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flag_snapshots_id_seq OWNER TO postgres;

--
-- Name: flag_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flag_snapshots_id_seq OWNED BY public.flag_snapshots.id;


--
-- Name: flags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flags (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    key character varying(64),
    description text,
    created_by text,
    updated_by text,
    enabled boolean,
    snapshot_id integer,
    notes text,
    data_records_enabled boolean,
    entity_type text
);


ALTER TABLE public.flags OWNER TO postgres;

--
-- Name: flags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flags_id_seq OWNER TO postgres;

--
-- Name: flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flags_id_seq OWNED BY public.flags.id;


--
-- Name: flags_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flags_tags (
    flag_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.flags_tags OWNER TO postgres;

--
-- Name: segments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.segments (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    flag_id integer,
    description text,
    rank integer,
    rollout_percent integer
);


ALTER TABLE public.segments OWNER TO postgres;

--
-- Name: segments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.segments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.segments_id_seq OWNER TO postgres;

--
-- Name: segments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.segments_id_seq OWNED BY public.segments.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    value character varying(64)
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    email text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: variants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variants (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    flag_id integer,
    key text,
    attachment text
);


ALTER TABLE public.variants OWNER TO postgres;

--
-- Name: variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.variants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variants_id_seq OWNER TO postgres;

--
-- Name: variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.variants_id_seq OWNED BY public.variants.id;


--
-- Name: constraints id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraints ALTER COLUMN id SET DEFAULT nextval('public.constraints_id_seq'::regclass);


--
-- Name: distributions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distributions ALTER COLUMN id SET DEFAULT nextval('public.distributions_id_seq'::regclass);


--
-- Name: flag_entity_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flag_entity_types ALTER COLUMN id SET DEFAULT nextval('public.flag_entity_types_id_seq'::regclass);


--
-- Name: flag_snapshots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flag_snapshots ALTER COLUMN id SET DEFAULT nextval('public.flag_snapshots_id_seq'::regclass);


--
-- Name: flags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flags ALTER COLUMN id SET DEFAULT nextval('public.flags_id_seq'::regclass);


--
-- Name: segments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segments ALTER COLUMN id SET DEFAULT nextval('public.segments_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: variants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variants ALTER COLUMN id SET DEFAULT nextval('public.variants_id_seq'::regclass);


--
-- Data for Name: constraints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constraints (id, created_at, updated_at, deleted_at, segment_id, property, operator, value) FROM stdin;
\.


--
-- Data for Name: distributions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.distributions (id, created_at, updated_at, deleted_at, segment_id, variant_id, variant_key, percent, bitmap) FROM stdin;
1	2021-10-12 11:00:53.9037+00	2021-10-12 11:00:53.920962+00	\N	1	1	India	100	
2	2021-10-12 11:02:10.860589+00	2021-10-12 11:02:10.876794+00	\N	2	2	acbf8b77-5bac-4284-97c2-3bff8d94fe2f	100	
\.


--
-- Data for Name: flag_entity_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flag_entity_types (id, created_at, updated_at, deleted_at, key) FROM stdin;
1	2021-10-12 10:55:48.510324+00	2021-10-12 10:55:48.510324+00	\N	
\.


--
-- Data for Name: flag_snapshots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flag_snapshots (id, created_at, updated_at, deleted_at, flag_id, updated_by, flag) FROM stdin;
1	2021-10-12 10:55:21.296958+00	2021-10-12 10:55:21.296958+00	\N	1		{"ID":1,"CreatedAt":"2021-10-12T10:55:21.276696Z","UpdatedAt":"2021-10-12T10:55:21.276696Z","DeletedAt":null,"Key":"kp3j1ahomxtiubf4k","Description":"country_specific_features","CreatedBy":"","UpdatedBy":"","Enabled":false,"Segments":[],"Variants":[],"Tags":[],"SnapshotID":0,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
2	2021-10-12 10:55:36.442926+00	2021-10-12 10:55:36.442926+00	\N	1		{"ID":1,"CreatedAt":"2021-10-12T10:55:21.276696Z","UpdatedAt":"2021-10-12T10:55:21.299935Z","DeletedAt":null,"Key":"kp3j1ahomxtiubf4k","Description":"country_specific_features","CreatedBy":"","UpdatedBy":"","Enabled":false,"Segments":[],"Variants":[{"ID":1,"CreatedAt":"2021-10-12T10:55:36.428592Z","UpdatedAt":"2021-10-12T10:55:36.428592Z","DeletedAt":null,"FlagID":1,"Key":"India","Attachment":{}}],"Tags":[],"SnapshotID":1,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
3	2021-10-12 10:55:47.911137+00	2021-10-12 10:55:47.911137+00	\N	1		{"ID":1,"CreatedAt":"2021-10-12T10:55:21.276696Z","UpdatedAt":"2021-10-12T10:55:47.902502Z","DeletedAt":null,"Key":"kp3j1ahomxtiubf4k","Description":"country_specific_features","CreatedBy":"","UpdatedBy":"","Enabled":true,"Segments":[],"Variants":[{"ID":1,"CreatedAt":"2021-10-12T10:55:36.428592Z","UpdatedAt":"2021-10-12T10:55:36.445413Z","DeletedAt":null,"FlagID":1,"Key":"India","Attachment":{}}],"Tags":[],"SnapshotID":2,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
4	2021-10-12 10:55:48.534635+00	2021-10-12 10:55:48.534635+00	\N	1		{"ID":1,"CreatedAt":"2021-10-12T10:55:21.276696Z","UpdatedAt":"2021-10-12T10:55:48.51416Z","DeletedAt":null,"Key":"country_specific_features","Description":"country_specific_features","CreatedBy":"","UpdatedBy":"","Enabled":true,"Segments":[],"Variants":[{"ID":1,"CreatedAt":"2021-10-12T10:55:36.428592Z","UpdatedAt":"2021-10-12T10:55:47.91364Z","DeletedAt":null,"FlagID":1,"Key":"India","Attachment":{}}],"Tags":[],"SnapshotID":3,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
5	2021-10-12 10:56:10.77164+00	2021-10-12 10:56:10.77164+00	\N	1		{"ID":1,"CreatedAt":"2021-10-12T10:55:21.276696Z","UpdatedAt":"2021-10-12T10:55:48.535341Z","DeletedAt":null,"Key":"country_specific_features","Description":"country_specific_features","CreatedBy":"","UpdatedBy":"","Enabled":true,"Segments":[],"Variants":[{"ID":1,"CreatedAt":"2021-10-12T10:55:36.428592Z","UpdatedAt":"2021-10-12T10:56:10.755087Z","DeletedAt":null,"FlagID":1,"Key":"India","Attachment":{"applicationLogo":"","countryCode":"+91","countryName":"India","currency":"INR","nationalities":["India","Others"],"stateAndDistricts":{"states":[{"capital":"Mayabunder","code":"AN","coordinates":["92.6586","11.7401"],"districts":[{"id":"1","name":"Nicobar"},{"id":"2","name":"North and Middle Andaman"},{"id":"3","name":"South Andaman"}],"id":"1","name":"Andaman and Nicobar Islands","type":"Union Territory"},{"capital":"Amaravati","code":"AP","coordinates":["79.7400","15.9129"],"districts":[{"id":"1","name":"Anantapur"},{"id":"2","name":"Chittoor"},{"id":"3","name":"East Godavari"},{"id":"4","name":"Guntur"},{"id":"5","name":"Krishna"},{"id":"6","name":"Kurnool"},{"id":"7","name":"Nellore"},{"id":"8","name":"Prakasam"},{"id":"9","name":"Srikakulam"},{"id":"10","name":"Visakhapatnam"},{"id":"11","name":"Vizianagaram"},{"id":"12","name":"West Godavari"},{"id":"13","name":"YSR Kadapa"}],"id":"2","name":"Andhra Pradesh","type":"State"},{"capital":"Itanagar","code":"AR","coordinates":["94.7278","28.2180"],"districts":[{"id":"1","name":"Tawang"},{"id":"2","name":"West Kameng"},{"id":"3","name":"East Kameng"},{"id":"4","name":"Papum Pare"},{"id":"5","name":"Kurung Kumey"},{"id":"6","name":"Kra Daadi"},{"id":"7","name":"Lower Subansiri"},{"id":"8","name":"Upper Subansiri"},{"id":"9","name":"West Siang"},{"id":"10","name":"East Siang"},{"id":"11","name":"Siang"},{"id":"12","name":"Upper Siang"},{"id":"13","name":"Lower Siang"},{"id":"14","name":"Lower Dibang Valley"},{"id":"15","name":"Dibang Valley"},{"id":"16","name":"Anjaw"},{"id":"17","name":"Lohit"},{"id":"18","name":"Namsai"},{"id":"19","name":"Changlang"},{"id":"20","name":"Tirap"},{"id":"21","name":"Longding"}],"id":"3","name":"Arunachal Pradesh","type":"State"},{"capital":"Dispur","code":"AS","coordinates":["92.9376","26.2006"],"districts":[{"id":"1","name":"Baksa"},{"id":"2","name":"Barpeta"},{"id":"3","name":"Biswanath"},{"id":"4","name":"Bongaigaon"},{"id":"5","name":"Cachar"},{"id":"6","name":"Charaideo"},{"id":"7","name":"Chirang"},{"id":"8","name":"Darrang"},{"id":"9","name":"Dhemaji"},{"id":"10","name":"Dhubri"},{"id":"11","name":"Dibrugarh"},{"id":"12","name":"Goalpara"},{"id":"13","name":"Golaghat"},{"id":"14","name":"Hailakandi"},{"id":"15","name":"Hojai"},{"id":"16","name":"Jorhat"},{"id":"17","name":"Kamrup Metropolitan"},{"id":"18","name":"Kamrup"},{"id":"19","name":"Karbi Anglong"},{"id":"20","name":"Karimganj"},{"id":"21","name":"Kokrajhar"},{"id":"22","name":"Lakhimpur"},{"id":"23","name":"Majuli"},{"id":"24","name":"Morigaon"},{"id":"25","name":"Nagaon"},{"id":"26","name":"Nalbari"},{"id":"27","name":"Dima Hasao"},{"id":"28","name":"Sivasagar"},{"id":"29","name":"Sonitpur"},{"id":"30","name":"South Salmara-Mankachar"},{"id":"31","name":"Tinsukia"},{"id":"32","name":"Udalguri"},{"id":"33","name":"West Karbi Anglong"}],"id":"4","name":"Assam","type":"State"},{"capital":"Patna","code":"BR","coordinates":["85.3131","25.0961"],"districts":[{"id":"1","name":"Araria"},{"id":"2","name":"Arwal"},{"id":"3","name":"Aurangabad"},{"id":"4","name":"Banka"},{"id":"5","name":"Begusarai"},{"id":"6","name":"Bhagalpur"},{"id":"7","name":"Bhojpur"},{"id":"8","name":"Buxar"},{"id":"9","name":"Darbhanga"},{"id":"10","name":"East Champaran (Motihari)"},{"id":"11","name":"Gaya"},{"id":"12","name":"Gopalganj"},{"id":"13","name":"Jamui"},{"id":"14","name":"Jehanabad"},{"id":"15","name":"Kaimur (Bhabua)"},{"id":"16","name":"Katihar"},{"id":"17","name":"Khagaria"},{"id":"18","name":"Kishanganj"},{"id":"19","name":"Lakhisarai"},{"id":"20","name":"Madhepura"},{"id":"21","name":"Madhubani"},{"id":"22","name":"Munger (Monghyr)"},{"id":"23","name":"Muzaffarpur"},{"id":"24","name":"Nalanda"},{"id":"25","name":"Nawada"},{"id":"26","name":"Patna"},{"id":"27","name":"Purnia (Purnea)"},{"id":"28","name":"Rohtas"},{"id":"29","name":"Saharsa"},{"id":"30","name":"Samastipur"},{"id":"31","name":"Saran"},{"id":"32","name":"Sheikhpura"},{"id":"33","name":"Sheohar"},{"id":"34","name":"Sitamarhi"},{"id":"35","name":"Siwan"},{"id":"36","name":"Supaul"},{"id":"37","name":"Vaishali"},{"id":"38","name":"West Champaran"}],"id":"5","name":"Bihar","type":"State"},{"capital":"Chandigarh","code":"CG","coordinates":["76.7794","30.7333"],"districts":[{"id":"1","name":"Chandigarh"}],"id":"6","name":"Chandigarh","type":"Union Territory"},{"capital":"Bilaspur (Judiciary), Raipur","code":"CH","coordinates":["81.8661","21.2787"],"districts":[{"id":"1","name":"Balod"},{"id":"2","name":"Baloda Bazar"},{"id":"3","name":"Balrampur"},{"id":"4","name":"Bastar"},{"id":"5","name":"Bemetara"},{"id":"6","name":"Bijapur"},{"id":"7","name":"Bilaspur"},{"id":"8","name":"Dantewada (South Bastar)"},{"id":"9","name":"Dhamtari"},{"id":"10","name":"Durg"},{"id":"11","name":"Gariyaband"},{"id":"12","name":"Janjgir-Champa"},{"id":"13","name":"Jashpur"},{"id":"14","name":"Kabirdham (Kawardha)"},{"id":"15","name":"Kanker (North Bastar)"},{"id":"16","name":"Kondagaon"},{"id":"17","name":"Korba"},{"id":"18","name":"Korea (Koriya)"},{"id":"19","name":"Mahasamund"},{"id":"20","name":"Mungeli"},{"id":"21","name":"Narayanpur"},{"id":"22","name":"Raigarh"},{"id":"23","name":"Raipur"},{"id":"24","name":"Rajnandgaon"},{"id":"25","name":"Sukma"},{"id":"26","name":"Surajpur  "},{"id":"27","name":"Surguja"}],"id":"7","name":"Chhattisgarh","type":"State"},{"capital":"Silvassa","code":"DH","coordinates":["73.0169","20.1809"],"districts":[{"id":"1","name":"Dadra \\\\u0026 Nagar Haveli"}],"id":"8","name":"Dadra and Nagar Haveli","type":"Union Territory"},{"capital":"Daman","code":"DD","coordinates":["72.8397","20.4283"],"districts":[{"id":"1","name":"Daman"},{"id":"2","name":"Diu"}],"id":"9","name":"Daman and Diu","type":"Union Territory"},{"capital":"New Delhi","code":"DL","coordinates":["77.1025","28.7041"],"districts":[{"id":"1","name":"Central Delhi"},{"id":"2","name":"East Delhi"},{"id":"3","name":"New Delhi"},{"id":"4","name":"North Delhi"},{"id":"5","name":"North East  Delhi"},{"id":"6","name":"North West  Delhi"},{"id":"7","name":"Shahdara"},{"id":"8","name":"South Delhi"},{"id":"9","name":"South East Delhi"},{"id":"10","name":"South West  Delhi"},{"id":"11","name":"West Delhi"}],"id":"10","name":"Delhi","type":"National Capital Territory"},{"capital":"Panaji","code":"GA","coordinates":["74.1240","15.2993"],"districts":[{"id":"1","name":"North Goa"},{"id":"2","name":"South Goa"}],"id":"11","name":"Goa","type":"State"},{"capital":"Gandhinagar","code":"GJ","coordinates":["71.1924","22.2587"],"districts":[{"id":"1","name":"Ahmedabad"},{"id":"2","name":"Amreli"},{"id":"3","name":"Anand"},{"id":"4","name":"Aravalli"},{"id":"5","name":"Banaskantha (Palanpur)"},{"id":"6","name":"Bharuch"},{"id":"7","name":"Bhavnagar"},{"id":"8","name":"Botad"},{"id":"9","name":"Chhota Udepur"},{"id":"10","name":"Dahod"},{"id":"11","name":"Dangs (Ahwa)"},{"id":"12","name":"Devbhoomi Dwarka"},{"id":"13","name":"Gandhinagar"},{"id":"14","name":"Gir Somnath"},{"id":"15","name":"Jamnagar"},{"id":"16","name":"Junagadh"},{"id":"17","name":"Kachchh"},{"id":"18","name":"Kheda (Nadiad)"},{"id":"19","name":"Mahisagar"},{"id":"20","name":"Mehsana"},{"id":"21","name":"Morbi"},{"id":"22","name":"Narmada (Rajpipla)"},{"id":"23","name":"Navsari"},{"id":"24","name":"Panchmahal (Godhra)"},{"id":"25","name":"Patan"},{"id":"26","name":"Porbandar"},{"id":"27","name":"Rajkot"},{"id":"28","name":"Sabarkantha (Himmatnagar)"},{"id":"29","name":"Surat"},{"id":"30","name":"Surendranagar"},{"id":"31","name":"Tapi (Vyara)"},{"id":"32","name":"Vadodara"},{"id":"33","name":"Valsad"}],"id":"12","name":"Gujarat","type":"State"},{"capital":"Chandigarh","code":"HR","coordinates":["76.0856","29.0588"],"districts":[{"id":"1","name":"Ambala"},{"id":"2","name":"Bhiwani"},{"id":"3","name":"Charkhi Dadri"},{"id":"4","name":"Faridabad"},{"id":"5","name":"Fatehabad"},{"id":"6","name":"Gurgaon"},{"id":"7","name":"Hisar"},{"id":"8","name":"Jhajjar"},{"id":"9","name":"Jind"},{"id":"10","name":"Kaithal"},{"id":"11","name":"Karnal"},{"id":"12","name":"Kurukshetra"},{"id":"13","name":"Mahendragarh"},{"id":"14","name":"Mewat"},{"id":"15","name":"Palwal"},{"id":"16","name":"Panchkula"},{"id":"17","name":"Panipat"},{"id":"18","name":"Rewari"},{"id":"19","name":"Rohtak"},{"id":"20","name":"Sirsa"},{"id":"21","name":"Sonipat"},{"id":"22","name":"Yamunanagar"}],"id":"13","name":"Haryana","type":"State"},{"capital":"Shimla","code":"HP","coordinates":["77.1734","31.1048"],"districts":[{"id":"1","name":"Bilaspur"},{"id":"2","name":"Chamba"},{"id":"3","name":"Hamirpur"},{"id":"4","name":"Kangra"},{"id":"5","name":"Kinnaur"},{"id":"6","name":"Kullu"},{"id":"7","name":"Lahaul \\\\u0026amp; Spiti"},{"id":"8","name":"Mandi"},{"id":"9","name":"Shimla"},{"id":"10","name":"Sirmaur (Sirmour)"},{"id":"11","name":"Solan"},{"id":"12","name":"Una"}],"id":"14","name":"Himachal Pradesh","type":"State"},{"capital":"Jammu (Winter), Srinagar (Summer)","code":"JK","coordinates":["76.5762","33.7782"],"districts":[{"id":"1","name":"Anantnag"},{"id":"2","name":"Bandipore"},{"id":"3","name":"Baramulla"},{"id":"4","name":"Budgam"},{"id":"5","name":"Doda"},{"id":"6","name":"Ganderbal"},{"id":"7","name":"Jammu"},{"id":"8","name":"Kargil"},{"id":"9","name":"Kathua"},{"id":"10","name":"Kishtwar"},{"id":"11","name":"Kulgam"},{"id":"12","name":"Kupwara"},{"id":"13","name":"Leh"},{"id":"14","name":"Poonch"},{"id":"15","name":"Pulwama"},{"id":"16","name":"Rajouri"},{"id":"17","name":"Ramban"},{"id":"18","name":"Reasi"},{"id":"19","name":"Samba"},{"id":"20","name":"Shopian"},{"id":"21","name":"Srinagar"},{"id":"22","name":"Udhampur"}],"id":"15","name":"Jammu and Kashmir","type":"Union Territory"},{"capital":"Ranchi","code":"JH","coordinates":["85.2799","23.6102"],"districts":[{"id":"1","name":"Bokaro"},{"id":"2","name":"Chatra"},{"id":"3","name":"Deoghar"},{"id":"4","name":"Dhanbad"},{"id":"5","name":"Dumka"},{"id":"6","name":"East Singhbhum"},{"id":"7","name":"Garhwa"},{"id":"8","name":"Giridih"},{"id":"9","name":"Godda"},{"id":"10","name":"Gumla"},{"id":"11","name":"Hazaribag"},{"id":"12","name":"Jamtara"},{"id":"13","name":"Khunti"},{"id":"14","name":"Koderma"},{"id":"15","name":"Latehar"},{"id":"16","name":"Lohardaga"},{"id":"17","name":"Pakur"},{"id":"18","name":"Palamu"},{"id":"19","name":"Ramgarh"},{"id":"20","name":"Ranchi"},{"id":"21","name":"Sahibganj"},{"id":"22","name":"Seraikela-Kharsawan"},{"id":"23","name":"Simdega"},{"id":"24","name":"West Singhbhum"}],"id":"16","name":"Jharkhand","type":"State"},{"capital":"Bengaluru","code":"KA","coordinates":["75.7139","15.3173"],"districts":[{"id":"1","name":"Bagalkot"},{"id":"2","name":"Ballari (Bellary)"},{"id":"3","name":"Belagavi (Belgaum)"},{"id":"4","name":"Bengaluru (Bangalore) Rural"},{"id":"5","name":"Bengaluru (Bangalore) Urban"},{"id":"6","name":"Bidar"},{"id":"7","name":"Chamarajanagar"},{"id":"8","name":"Chikballapur"},{"id":"9","name":"Chikkamagaluru (Chikmagalur)"},{"id":"10","name":"Chitradurga"},{"id":"11","name":"Dakshina Kannada"},{"id":"12","name":"Davangere"},{"id":"13","name":"Dharwad"},{"id":"14","name":"Gadag"},{"id":"15","name":"Hassan"},{"id":"16","name":"Haveri"},{"id":"17","name":"Kalaburagi (Gulbarga)"},{"id":"18","name":"Kodagu"},{"id":"19","name":"Kolar"},{"id":"20","name":"Koppal"},{"id":"21","name":"Mandya"},{"id":"22","name":"Mysuru (Mysore)"},{"id":"23","name":"Raichur"},{"id":"24","name":"Ramanagara"},{"id":"25","name":"Shivamogga (Shimoga)"},{"id":"26","name":"Tumakuru (Tumkur)"},{"id":"27","name":"Udupi"},{"id":"28","name":"Uttara Kannada (Karwar)"},{"id":"29","name":"Vijayapura (Bijapur)"},{"id":"30","name":"Yadgir"}],"id":"17","name":"Karnataka","type":"State"},{"capital":"Thiruvananthapuram","code":"KL","coordinates":["76.2711","10.8505"],"districts":[{"id":"1","name":"Alappuzha"},{"id":"2","name":"Ernakulam"},{"id":"3","name":"Idukki"},{"id":"4","name":"Kannur"},{"id":"5","name":"Kasaragod"},{"id":"6","name":"Kollam"},{"id":"7","name":"Kottayam"},{"id":"8","name":"Kozhikode"},{"id":"9","name":"Malappuram"},{"id":"10","name":"Palakkad"},{"id":"11","name":"Pathanamthitta"},{"id":"12","name":"Thiruvananthapuram"},{"id":"13","name":"Thrissur"},{"id":"14","name":"Wayanad"}],"id":"18","name":"Kerala","type":"State"},{"capital":"Leh, Kargil","code":"LA","coordinates":["77.6151","34.2095"],"districts":[{"id":"1","name":"Kargil"},{"id":"2","name":"Leh"}],"id":"19","name":"Ladakh","type":"Union Territory"},{"capital":"Kavaratti","code":"LD","coordinates":["72.1833","13.7000"],"districts":[{"id":"1","name":"Agatti"},{"id":"2","name":"Amini"},{"id":"3","name":"Androth"},{"id":"4","name":"Bithra"},{"id":"5","name":"Chethlath"},{"id":"6","name":"Kavaratti"},{"id":"7","name":"Kadmath"},{"id":"8","name":"Kalpeni"},{"id":"9","name":"Kilthan"},{"id":"10","name":"Minicoy"}],"id":"20","name":"Lakshadweep","type":"Union Territory"},{"capital":"Bhopal","code":"MP","coordinates":["78.6569","22.9734"],"districts":[{"id":"1","name":"Agar Malwa"},{"id":"2","name":"Alirajpur"},{"id":"3","name":"Anuppur"},{"id":"4","name":"Ashoknagar"},{"id":"5","name":"Balaghat"},{"id":"6","name":"Barwani"},{"id":"7","name":"Betul"},{"id":"8","name":"Bhind"},{"id":"9","name":"Bhopal"},{"id":"10","name":"Burhanpur"},{"id":"11","name":"Chhatarpur"},{"id":"12","name":"Chhindwara"},{"id":"13","name":"Damoh"},{"id":"14","name":"Datia"},{"id":"15","name":"Dewas"},{"id":"16","name":"Dhar"},{"id":"17","name":"Dindori"},{"id":"18","name":"Guna"},{"id":"19","name":"Gwalior"},{"id":"20","name":"Harda"},{"id":"21","name":"Hoshangabad"},{"id":"22","name":"Indore"},{"id":"23","name":"Jabalpur"},{"id":"24","name":"Jhabua"},{"id":"25","name":"Katni"},{"id":"26","name":"Khandwa"},{"id":"27","name":"Khargone"},{"id":"28","name":"Mandla"},{"id":"29","name":"Mandsaur"},{"id":"30","name":"Morena"},{"id":"31","name":"Narsinghpur"},{"id":"32","name":"Neemuch"},{"id":"33","name":"Panna"},{"id":"34","name":"Raisen"},{"id":"35","name":"Rajgarh"},{"id":"36","name":"Ratlam"},{"id":"37","name":"Rewa"},{"id":"38","name":"Sagar"},{"id":"39","name":"Satna"},{"id":"40","name":"Sehore"},{"id":"41","name":"Seoni"},{"id":"42","name":"Shahdol"},{"id":"43","name":"Shajapur"},{"id":"44","name":"Sheopur"},{"id":"45","name":"Shivpuri"},{"id":"46","name":"Sidhi"},{"id":"47","name":"Singrauli"},{"id":"48","name":"Tikamgarh"},{"id":"49","name":"Ujjain"},{"id":"50","name":"Umaria"},{"id":"51","name":"Vidisha"}],"id":"21","name":"Madhya Pradesh","type":"State"},{"capital":"Mumbai","code":"MH","coordinates":["75.7139","19.7515"],"districts":[{"id":"1","name":"Ahmednagar"},{"id":"2","name":"Akola"},{"id":"3","name":"Amravati"},{"id":"4","name":"Aurangabad"},{"id":"5","name":"Beed"},{"id":"6","name":"Bhandara"},{"id":"7","name":"Buldhana"},{"id":"8","name":"Chandrapur"},{"id":"9","name":"Dhule"},{"id":"10","name":"Gadchiroli"},{"id":"11","name":"Gondia"},{"id":"12","name":"Hingoli"},{"id":"13","name":"Jalgaon"},{"id":"14","name":"Jalna"},{"id":"15","name":"Kolhapur"},{"id":"16","name":"Latur"},{"id":"17","name":"Mumbai City"},{"id":"18","name":"Mumbai Suburban"},{"id":"19","name":"Nagpur"},{"id":"20","name":"Nanded"},{"id":"21","name":"Nandurbar"},{"id":"22","name":"Nashik"},{"id":"23","name":"Osmanabad"},{"id":"24","name":"Palghar"},{"id":"25","name":"Parbhani"},{"id":"26","name":"Pune"},{"id":"27","name":"Raigad"},{"id":"28","name":"Ratnagiri"},{"id":"29","name":"Sangli"},{"id":"30","name":"Satara"},{"id":"31","name":"Sindhudurg"},{"id":"32","name":"Solapur"},{"id":"33","name":"Thane"},{"id":"34","name":"Wardha"},{"id":"35","name":"Washim"},{"id":"36","name":"Yavatmal"}],"id":"22","name":"Maharashtra","type":"State"},{"capital":"Imphal","code":"MN","coordinates":["93.9063","24.6637"],"districts":[{"id":"1","name":"Bishnupur"},{"id":"2","name":"Chandel"},{"id":"3","name":"Churachandpur"},{"id":"4","name":"Imphal East"},{"id":"5","name":"Imphal West"},{"id":"6","name":"Jiribam"},{"id":"7","name":"Kakching"},{"id":"8","name":"Kamjong"},{"id":"9","name":"Kangpokpi"},{"id":"10","name":"Noney"},{"id":"11","name":"Pherzawl"},{"id":"12","name":"Senapati"},{"id":"13","name":"Tamenglong"},{"id":"14","name":"Tengnoupal"},{"id":"15","name":"Thoubal"},{"id":"16","name":"Ukhrul"}],"id":"23","name":"Manipur","type":"State"},{"capital":"Shillong","code":"ML","coordinates":["91.3662","25.4670"],"districts":[{"id":"1","name":"East Garo Hills"},{"id":"2","name":"East Jaintia Hills"},{"id":"3","name":"East Khasi Hills"},{"id":"4","name":"North Garo Hills"},{"id":"5","name":"Ri Bhoi"},{"id":"6","name":"South Garo Hills"},{"id":"7","name":"South West Garo Hills "},{"id":"8","name":"South West Khasi Hills"},{"id":"9","name":"West Garo Hills"},{"id":"10","name":"West Jaintia Hills"},{"id":"11","name":"West Khasi Hills"}],"id":"24","name":"Meghalaya","type":"State"},{"capital":"Aizawl","code":"MZ","coordinates":["92.9376","23.1645"],"districts":[{"id":"1","name":"Aizawl"},{"id":"2","name":"Champhai"},{"id":"3","name":"Kolasib"},{"id":"4","name":"Lawngtlai"},{"id":"5","name":"Lunglei"},{"id":"6","name":"Mamit"},{"id":"7","name":"Saiha"},{"id":"8","name":"Serchhip"}],"id":"25","name":"Mizoram","type":"State"},{"capital":"Kohima","code":"NL","coordinates":["94.5624","26.1584"],"districts":[{"id":"1","name":"Dimapur"},{"id":"2","name":"Kiphire"},{"id":"3","name":"Kohima"},{"id":"4","name":"Longleng"},{"id":"5","name":"Mokokchung"},{"id":"6","name":"Mon"},{"id":"7","name":"Peren"},{"id":"8","name":"Phek"},{"id":"9","name":"Tuensang"},{"id":"10","name":"Wokha"},{"id":"11","name":"Zunheboto"}],"id":"26","name":"Nagaland","type":"State"},{"capital":"Bhubaneswar","code":"OR","coordinates":["85.0985","20.9517"],"districts":[{"id":"1","name":"Angul"},{"id":"2","name":"Balangir"},{"id":"3","name":"Balasore"},{"id":"4","name":"Bargarh"},{"id":"5","name":"Bhadrak"},{"id":"6","name":"Boudh"},{"id":"7","name":"Cuttack"},{"id":"8","name":"Deogarh"},{"id":"9","name":"Dhenkanal"},{"id":"10","name":"Gajapati"},{"id":"11","name":"Ganjam"},{"id":"12","name":"Jagatsinghapur"},{"id":"13","name":"Jajpur"},{"id":"14","name":"Jharsuguda"},{"id":"15","name":"Kalahandi"},{"id":"16","name":"Kandhamal"},{"id":"17","name":"Kendrapara"},{"id":"18","name":"Kendujhar (Keonjhar)"},{"id":"19","name":"Khordha"},{"id":"20","name":"Koraput"},{"id":"21","name":"Malkangiri"},{"id":"22","name":"Mayurbhanj"},{"id":"23","name":"Nabarangpur"},{"id":"24","name":"Nayagarh"},{"id":"25","name":"Nuapada"},{"id":"26","name":"Puri"},{"id":"27","name":"Rayagada"},{"id":"28","name":"Sambalpur"},{"id":"29","name":"Sonepur"},{"id":"30","name":"Sundargarh"}],"id":"27","name":"Odisha","type":"State"},{"capital":"Puducherry","code":"PY","coordinates":["79.8083","11.9416"],"districts":[{"id":"1","name":"Karaikal"},{"id":"2","name":"Mahe"},{"id":"3","name":"Pondicherry"},{"id":"4","name":"Yanam"}],"id":"28","name":"Puducherry","type":"Union Territory"},{"capital":"Chandigarh","code":"PB","coordinates":["75.3412","31.1471"],"districts":[{"id":"1","name":"Amritsar"},{"id":"2","name":"Barnala"},{"id":"3","name":"Bathinda"},{"id":"4","name":"Faridkot"},{"id":"5","name":"Fatehgarh Sahib"},{"id":"6","name":"Fazilka"},{"id":"7","name":"Ferozepur"},{"id":"8","name":"Gurdaspur"},{"id":"9","name":"Hoshiarpur"},{"id":"10","name":"Jalandhar"},{"id":"11","name":"Kapurthala"},{"id":"12","name":"Ludhiana"},{"id":"13","name":"Mansa"},{"id":"14","name":"Moga"},{"id":"15","name":"Muktsar"},{"id":"16","name":"Nawanshahr (Shahid Bhagat Singh Nagar)"},{"id":"17","name":"Pathankot"},{"id":"18","name":"Patiala"},{"id":"19","name":"Rupnagar"},{"id":"20","name":"Sahibzada Ajit Singh Nagar (Mohali)"},{"id":"21","name":"Sangrur"},{"id":"22","name":"Tarn Taran"}],"id":"29","name":"Punjab","type":"State"},{"capital":"Jaipur","code":"RJ","coordinates":["74.2179","27.0238"],"districts":[{"id":"1","name":"Ajmer"},{"id":"2","name":"Alwar"},{"id":"3","name":"Banswara"},{"id":"4","name":"Baran"},{"id":"5","name":"Barmer"},{"id":"6","name":"Bharatpur"},{"id":"7","name":"Bhilwara"},{"id":"8","name":"Bikaner"},{"id":"9","name":"Bundi"},{"id":"10","name":"Chittorgarh"},{"id":"11","name":"Churu"},{"id":"12","name":"Dausa"},{"id":"13","name":"Dholpur"},{"id":"14","name":"Dungarpur"},{"id":"15","name":"Hanumangarh"},{"id":"16","name":"Jaipur"},{"id":"17","name":"Jaisalmer"},{"id":"18","name":"Jalore"},{"id":"19","name":"Jhalawar"},{"id":"20","name":"Jhunjhunu"},{"id":"21","name":"Jodhpur"},{"id":"22","name":"Karauli"},{"id":"23","name":"Kota"},{"id":"24","name":"Nagaur"},{"id":"25","name":"Pali"},{"id":"26","name":"Pratapgarh"},{"id":"27","name":"Rajsamand"},{"id":"28","name":"Sawai Madhopur"},{"id":"29","name":"Sikar"},{"id":"30","name":"Sirohi"},{"id":"31","name":"Sri Ganganagar"},{"id":"32","name":"Tonk"},{"id":"33","name":"Udaipur"}],"id":"30","name":"Rajasthan","type":"State"},{"capital":"Gangtok","code":"SK","coordinates":["88.5122","27.5330"],"districts":[{"id":"1","name":"East Sikkim"},{"id":"2","name":"North Sikkim"},{"id":"3","name":"South Sikkim"},{"id":"4","name":"West Sikkim"}],"id":"31","name":"Sikkim","type":"State"},{"capital":"Chennai","code":"TN","coordinates":["78.6569","11.1271"],"districts":[{"id":"1","name":"Ariyalur"},{"id":"2","name":"Chennai"},{"id":"3","name":"Coimbatore"},{"id":"4","name":"Cuddalore"},{"id":"5","name":"Dharmapuri"},{"id":"6","name":"Dindigul"},{"id":"7","name":"Erode"},{"id":"8","name":"Kanchipuram"},{"id":"9","name":"Kanyakumari"},{"id":"10","name":"Karur"},{"id":"11","name":"Krishnagiri"},{"id":"12","name":"Madurai"},{"id":"13","name":"Nagapattinam"},{"id":"14","name":"Namakkal"},{"id":"15","name":"Nilgiris"},{"id":"16","name":"Perambalur"},{"id":"17","name":"Pudukkottai"},{"id":"18","name":"Ramanathapuram"},{"id":"19","name":"Salem"},{"id":"20","name":"Sivaganga"},{"id":"21","name":"Thanjavur"},{"id":"22","name":"Theni"},{"id":"23","name":"Thoothukudi (Tuticorin)"},{"id":"24","name":"Tiruchirappalli"},{"id":"25","name":"Tirunelveli"},{"id":"26","name":"Tiruppur"},{"id":"27","name":"Tiruvallur"},{"id":"28","name":"Tiruvannamalai"},{"id":"29","name":"Tiruvarur"},{"id":"30","name":"Vellore"},{"id":"31","name":"Viluppuram"},{"id":"32","name":"Virudhunagar"}],"id":"32","name":"Tamil Nadu","type":"State"},{"capital":"Hyderabad","code":"TS","coordinates":["79.0193","18.1124"],"districts":[{"id":"1","name":"Adilabad"},{"id":"2","name":"Bhadradri Kothagudem"},{"id":"3","name":"Hyderabad"},{"id":"4","name":"Jagtial"},{"id":"5","name":"Jangaon"},{"id":"6","name":"Jayashankar Bhoopalpally"},{"id":"7","name":"Jogulamba Gadwal"},{"id":"8","name":"Kamareddy"},{"id":"9","name":"Karimnagar"},{"id":"10","name":"Khammam"},{"id":"11","name":"Komaram Bheem Asifabad"},{"id":"12","name":"Mahabubabad"},{"id":"13","name":"Mahabubnagar"},{"id":"14","name":"Mancherial"},{"id":"15","name":"Medak"},{"id":"16","name":"Medchal"},{"id":"17","name":"Nagarkurnool"},{"id":"18","name":"Nalgonda"},{"id":"19","name":"Nirmal"},{"id":"20","name":"Nizamabad"},{"id":"21","name":"Peddapalli"},{"id":"22","name":"Rajanna Sircilla"},{"id":"23","name":"Rangareddy"},{"id":"24","name":"Sangareddy"},{"id":"25","name":"Siddipet"},{"id":"26","name":"Suryapet"},{"id":"27","name":"Vikarabad"},{"id":"28","name":"Wanaparthy"},{"id":"29","name":"Warangal (Rural)"},{"id":"30","name":"Warangal (Urban)"},{"id":"31","name":"Yadadri Bhuvanagiri"}],"id":"33","name":"Telangana","type":"State"},{"capital":"Agartala","code":"TR","coordinates":["91.9882","23.9408"],"districts":[{"id":"1","name":"Dhalai"},{"id":"2","name":"Gomati"},{"id":"3","name":"Khowai"},{"id":"4","name":"North Tripura"},{"id":"5","name":"Sepahijala"},{"id":"6","name":"South Tripura"},{"id":"7","name":"Unakoti"},{"id":"8","name":"West Tripura"}],"id":"34","name":"Tripura","type":"State"},{"capital":"Lucknow","code":"UP","coordinates":["80.9462","26.8467"],"districts":[{"id":"1","name":"Agra"},{"id":"2","name":"Aligarh"},{"id":"3","name":"Allahabad"},{"id":"4","name":"Ambedkar Nagar"},{"id":"5","name":"Amethi (Chatrapati Sahuji Mahraj Nagar)"},{"id":"6","name":"Amroha (J.P. Nagar)"},{"id":"7","name":"Auraiya"},{"id":"8","name":"Azamgarh"},{"id":"9","name":"Baghpat"},{"id":"10","name":"Bahraich"},{"id":"11","name":"Ballia"},{"id":"12","name":"Balrampur"},{"id":"13","name":"Banda"},{"id":"14","name":"Barabanki"},{"id":"15","name":"Bareilly"},{"id":"16","name":"Basti"},{"id":"17","name":"Bhadohi"},{"id":"18","name":"Bijnor"},{"id":"19","name":"Budaun"},{"id":"20","name":"Bulandshahr"},{"id":"21","name":"Chandauli"},{"id":"22","name":"Chitrakoot"},{"id":"23","name":"Deoria"},{"id":"24","name":"Etah"},{"id":"25","name":"Etawah"},{"id":"26","name":"Faizabad"},{"id":"27","name":"Farrukhabad"},{"id":"28","name":"Fatehpur"},{"id":"29","name":"Firozabad"},{"id":"30","name":"Gautam Buddha Nagar"},{"id":"31","name":"Ghaziabad"},{"id":"32","name":"Ghazipur"},{"id":"33","name":"Gonda"},{"id":"34","name":"Gorakhpur"},{"id":"35","name":"Hamirpur"},{"id":"36","name":"Hapur (Panchsheel Nagar)"},{"id":"37","name":"Hardoi"},{"id":"38","name":"Hathras"},{"id":"39","name":"Jalaun"},{"id":"40","name":"Jaunpur"},{"id":"41","name":"Jhansi"},{"id":"42","name":"Kannauj"},{"id":"43","name":"Kanpur Dehat"},{"id":"44","name":"Kanpur Nagar"},{"id":"45","name":"Kanshiram Nagar (Kasganj)"},{"id":"46","name":"Kaushambi"},{"id":"47","name":"Kushinagar (Padrauna)"},{"id":"48","name":"Lakhimpur - Kheri"},{"id":"49","name":"Lalitpur"},{"id":"50","name":"Lucknow"},{"id":"51","name":"Maharajganj"},{"id":"52","name":"Mahoba"},{"id":"53","name":"Mainpuri"},{"id":"54","name":"Mathura"},{"id":"55","name":"Mau"},{"id":"56","name":"Meerut"},{"id":"57","name":"Mirzapur"},{"id":"58","name":"Moradabad"},{"id":"59","name":"Muzaffarnagar"},{"id":"60","name":"Pilibhit"},{"id":"61","name":"Pratapgarh"},{"id":"62","name":"RaeBareli"},{"id":"63","name":"Rampur"},{"id":"64","name":"Saharanpur"},{"id":"65","name":"Sambhal (Bhim Nagar)"},{"id":"66","name":"Sant Kabir Nagar"},{"id":"67","name":"Shahjahanpur"},{"id":"68","name":"Shamali (Prabuddh Nagar)"},{"id":"69","name":"Shravasti"},{"id":"70","name":"Siddharth Nagar"},{"id":"71","name":"Sitapur"},{"id":"72","name":"Sonbhadra"},{"id":"73","name":"Sultanpur"},{"id":"74","name":"Unnao"},{"id":"75","name":"Varanasi"}],"id":"35","name":"Uttar Pradesh","type":"State"},{"capital":"Dehradun","code":"UK","coordinates":["78.0322","30.3165"],"districts":[{"id":"1","name":"Almora"},{"id":"2","name":"Bageshwar"},{"id":"3","name":"Chamoli"},{"id":"4","name":"Champawat"},{"id":"5","name":"Dehradun"},{"id":"6","name":"Haridwar"},{"id":"7","name":"Nainital"},{"id":"8","name":"Pauri Garhwal"},{"id":"9","name":"Pithoragarh"},{"id":"10","name":"Rudraprayag"},{"id":"11","name":"Tehri Garhwal"},{"id":"12","name":"Udham Singh Nagar"},{"id":"13","name":"Uttarkashi"}],"id":"36","name":"Uttarakhand","type":"State"},{"capital":"Kolkata","code":"WB","coordinates":["87.8550","22.9868"],"districts":[{"id":"1","name":"Alipurduar"},{"id":"2","name":"Bankura"},{"id":"3","name":"Birbhum"},{"id":"4","name":"Burdwan (Bardhaman)"},{"id":"5","name":"Cooch Behar"},{"id":"6","name":"Dakshin Dinajpur (South Dinajpur)"},{"id":"7","name":"Darjeeling"},{"id":"8","name":"Hooghly"},{"id":"9","name":"Howrah"},{"id":"10","name":"Jalpaiguri"},{"id":"11","name":"Kalimpong"},{"id":"12","name":"Kolkata"},{"id":"13","name":"Malda"},{"id":"14","name":"Murshidabad"},{"id":"15","name":"Nadia"},{"id":"16","name":"North 24 Parganas"},{"id":"17","name":"Paschim Medinipur (West Medinipur)"},{"id":"18","name":"Purba Medinipur (East Medinipur)"},{"id":"19","name":"Purulia"},{"id":"20","name":"South 24 Parganas"},{"id":"21","name":"Uttar Dinajpur (North Dinajpur)"}],"id":"37","name":"West Bengal","type":"State"}]}}}],"Tags":[],"SnapshotID":4,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
6	2021-10-12 11:00:47.114635+00	2021-10-12 11:00:47.114635+00	\N	1		{"ID":1,"CreatedAt":"2021-10-12T10:55:21.276696Z","UpdatedAt":"2021-10-12T10:56:10.77465Z","DeletedAt":null,"Key":"country_specific_features","Description":"country_specific_features","CreatedBy":"","UpdatedBy":"","Enabled":true,"Segments":[{"ID":1,"CreatedAt":"2021-10-12T11:00:47.098956Z","UpdatedAt":"2021-10-12T11:00:47.098956Z","DeletedAt":null,"FlagID":1,"Description":"default","Rank":999,"RolloutPercent":100,"Constraints":[],"Distributions":[]}],"Variants":[{"ID":1,"CreatedAt":"2021-10-12T10:55:36.428592Z","UpdatedAt":"2021-10-12T10:56:10.776057Z","DeletedAt":null,"FlagID":1,"Key":"India","Attachment":{"applicationLogo":"","countryCode":"+91","countryName":"India","currency":"INR","nationalities":["India","Others"],"stateAndDistricts":{"states":[{"capital":"Mayabunder","code":"AN","coordinates":["92.6586","11.7401"],"districts":[{"id":"1","name":"Nicobar"},{"id":"2","name":"North and Middle Andaman"},{"id":"3","name":"South Andaman"}],"id":"1","name":"Andaman and Nicobar Islands","type":"Union Territory"},{"capital":"Amaravati","code":"AP","coordinates":["79.7400","15.9129"],"districts":[{"id":"1","name":"Anantapur"},{"id":"2","name":"Chittoor"},{"id":"3","name":"East Godavari"},{"id":"4","name":"Guntur"},{"id":"5","name":"Krishna"},{"id":"6","name":"Kurnool"},{"id":"7","name":"Nellore"},{"id":"8","name":"Prakasam"},{"id":"9","name":"Srikakulam"},{"id":"10","name":"Visakhapatnam"},{"id":"11","name":"Vizianagaram"},{"id":"12","name":"West Godavari"},{"id":"13","name":"YSR Kadapa"}],"id":"2","name":"Andhra Pradesh","type":"State"},{"capital":"Itanagar","code":"AR","coordinates":["94.7278","28.2180"],"districts":[{"id":"1","name":"Tawang"},{"id":"2","name":"West Kameng"},{"id":"3","name":"East Kameng"},{"id":"4","name":"Papum Pare"},{"id":"5","name":"Kurung Kumey"},{"id":"6","name":"Kra Daadi"},{"id":"7","name":"Lower Subansiri"},{"id":"8","name":"Upper Subansiri"},{"id":"9","name":"West Siang"},{"id":"10","name":"East Siang"},{"id":"11","name":"Siang"},{"id":"12","name":"Upper Siang"},{"id":"13","name":"Lower Siang"},{"id":"14","name":"Lower Dibang Valley"},{"id":"15","name":"Dibang Valley"},{"id":"16","name":"Anjaw"},{"id":"17","name":"Lohit"},{"id":"18","name":"Namsai"},{"id":"19","name":"Changlang"},{"id":"20","name":"Tirap"},{"id":"21","name":"Longding"}],"id":"3","name":"Arunachal Pradesh","type":"State"},{"capital":"Dispur","code":"AS","coordinates":["92.9376","26.2006"],"districts":[{"id":"1","name":"Baksa"},{"id":"2","name":"Barpeta"},{"id":"3","name":"Biswanath"},{"id":"4","name":"Bongaigaon"},{"id":"5","name":"Cachar"},{"id":"6","name":"Charaideo"},{"id":"7","name":"Chirang"},{"id":"8","name":"Darrang"},{"id":"9","name":"Dhemaji"},{"id":"10","name":"Dhubri"},{"id":"11","name":"Dibrugarh"},{"id":"12","name":"Goalpara"},{"id":"13","name":"Golaghat"},{"id":"14","name":"Hailakandi"},{"id":"15","name":"Hojai"},{"id":"16","name":"Jorhat"},{"id":"17","name":"Kamrup Metropolitan"},{"id":"18","name":"Kamrup"},{"id":"19","name":"Karbi Anglong"},{"id":"20","name":"Karimganj"},{"id":"21","name":"Kokrajhar"},{"id":"22","name":"Lakhimpur"},{"id":"23","name":"Majuli"},{"id":"24","name":"Morigaon"},{"id":"25","name":"Nagaon"},{"id":"26","name":"Nalbari"},{"id":"27","name":"Dima Hasao"},{"id":"28","name":"Sivasagar"},{"id":"29","name":"Sonitpur"},{"id":"30","name":"South Salmara-Mankachar"},{"id":"31","name":"Tinsukia"},{"id":"32","name":"Udalguri"},{"id":"33","name":"West Karbi Anglong"}],"id":"4","name":"Assam","type":"State"},{"capital":"Patna","code":"BR","coordinates":["85.3131","25.0961"],"districts":[{"id":"1","name":"Araria"},{"id":"2","name":"Arwal"},{"id":"3","name":"Aurangabad"},{"id":"4","name":"Banka"},{"id":"5","name":"Begusarai"},{"id":"6","name":"Bhagalpur"},{"id":"7","name":"Bhojpur"},{"id":"8","name":"Buxar"},{"id":"9","name":"Darbhanga"},{"id":"10","name":"East Champaran (Motihari)"},{"id":"11","name":"Gaya"},{"id":"12","name":"Gopalganj"},{"id":"13","name":"Jamui"},{"id":"14","name":"Jehanabad"},{"id":"15","name":"Kaimur (Bhabua)"},{"id":"16","name":"Katihar"},{"id":"17","name":"Khagaria"},{"id":"18","name":"Kishanganj"},{"id":"19","name":"Lakhisarai"},{"id":"20","name":"Madhepura"},{"id":"21","name":"Madhubani"},{"id":"22","name":"Munger (Monghyr)"},{"id":"23","name":"Muzaffarpur"},{"id":"24","name":"Nalanda"},{"id":"25","name":"Nawada"},{"id":"26","name":"Patna"},{"id":"27","name":"Purnia (Purnea)"},{"id":"28","name":"Rohtas"},{"id":"29","name":"Saharsa"},{"id":"30","name":"Samastipur"},{"id":"31","name":"Saran"},{"id":"32","name":"Sheikhpura"},{"id":"33","name":"Sheohar"},{"id":"34","name":"Sitamarhi"},{"id":"35","name":"Siwan"},{"id":"36","name":"Supaul"},{"id":"37","name":"Vaishali"},{"id":"38","name":"West Champaran"}],"id":"5","name":"Bihar","type":"State"},{"capital":"Chandigarh","code":"CG","coordinates":["76.7794","30.7333"],"districts":[{"id":"1","name":"Chandigarh"}],"id":"6","name":"Chandigarh","type":"Union Territory"},{"capital":"Bilaspur (Judiciary), Raipur","code":"CH","coordinates":["81.8661","21.2787"],"districts":[{"id":"1","name":"Balod"},{"id":"2","name":"Baloda Bazar"},{"id":"3","name":"Balrampur"},{"id":"4","name":"Bastar"},{"id":"5","name":"Bemetara"},{"id":"6","name":"Bijapur"},{"id":"7","name":"Bilaspur"},{"id":"8","name":"Dantewada (South Bastar)"},{"id":"9","name":"Dhamtari"},{"id":"10","name":"Durg"},{"id":"11","name":"Gariyaband"},{"id":"12","name":"Janjgir-Champa"},{"id":"13","name":"Jashpur"},{"id":"14","name":"Kabirdham (Kawardha)"},{"id":"15","name":"Kanker (North Bastar)"},{"id":"16","name":"Kondagaon"},{"id":"17","name":"Korba"},{"id":"18","name":"Korea (Koriya)"},{"id":"19","name":"Mahasamund"},{"id":"20","name":"Mungeli"},{"id":"21","name":"Narayanpur"},{"id":"22","name":"Raigarh"},{"id":"23","name":"Raipur"},{"id":"24","name":"Rajnandgaon"},{"id":"25","name":"Sukma"},{"id":"26","name":"Surajpur  "},{"id":"27","name":"Surguja"}],"id":"7","name":"Chhattisgarh","type":"State"},{"capital":"Silvassa","code":"DH","coordinates":["73.0169","20.1809"],"districts":[{"id":"1","name":"Dadra \\\\u0026 Nagar Haveli"}],"id":"8","name":"Dadra and Nagar Haveli","type":"Union Territory"},{"capital":"Daman","code":"DD","coordinates":["72.8397","20.4283"],"districts":[{"id":"1","name":"Daman"},{"id":"2","name":"Diu"}],"id":"9","name":"Daman and Diu","type":"Union Territory"},{"capital":"New Delhi","code":"DL","coordinates":["77.1025","28.7041"],"districts":[{"id":"1","name":"Central Delhi"},{"id":"2","name":"East Delhi"},{"id":"3","name":"New Delhi"},{"id":"4","name":"North Delhi"},{"id":"5","name":"North East  Delhi"},{"id":"6","name":"North West  Delhi"},{"id":"7","name":"Shahdara"},{"id":"8","name":"South Delhi"},{"id":"9","name":"South East Delhi"},{"id":"10","name":"South West  Delhi"},{"id":"11","name":"West Delhi"}],"id":"10","name":"Delhi","type":"National Capital Territory"},{"capital":"Panaji","code":"GA","coordinates":["74.1240","15.2993"],"districts":[{"id":"1","name":"North Goa"},{"id":"2","name":"South Goa"}],"id":"11","name":"Goa","type":"State"},{"capital":"Gandhinagar","code":"GJ","coordinates":["71.1924","22.2587"],"districts":[{"id":"1","name":"Ahmedabad"},{"id":"2","name":"Amreli"},{"id":"3","name":"Anand"},{"id":"4","name":"Aravalli"},{"id":"5","name":"Banaskantha (Palanpur)"},{"id":"6","name":"Bharuch"},{"id":"7","name":"Bhavnagar"},{"id":"8","name":"Botad"},{"id":"9","name":"Chhota Udepur"},{"id":"10","name":"Dahod"},{"id":"11","name":"Dangs (Ahwa)"},{"id":"12","name":"Devbhoomi Dwarka"},{"id":"13","name":"Gandhinagar"},{"id":"14","name":"Gir Somnath"},{"id":"15","name":"Jamnagar"},{"id":"16","name":"Junagadh"},{"id":"17","name":"Kachchh"},{"id":"18","name":"Kheda (Nadiad)"},{"id":"19","name":"Mahisagar"},{"id":"20","name":"Mehsana"},{"id":"21","name":"Morbi"},{"id":"22","name":"Narmada (Rajpipla)"},{"id":"23","name":"Navsari"},{"id":"24","name":"Panchmahal (Godhra)"},{"id":"25","name":"Patan"},{"id":"26","name":"Porbandar"},{"id":"27","name":"Rajkot"},{"id":"28","name":"Sabarkantha (Himmatnagar)"},{"id":"29","name":"Surat"},{"id":"30","name":"Surendranagar"},{"id":"31","name":"Tapi (Vyara)"},{"id":"32","name":"Vadodara"},{"id":"33","name":"Valsad"}],"id":"12","name":"Gujarat","type":"State"},{"capital":"Chandigarh","code":"HR","coordinates":["76.0856","29.0588"],"districts":[{"id":"1","name":"Ambala"},{"id":"2","name":"Bhiwani"},{"id":"3","name":"Charkhi Dadri"},{"id":"4","name":"Faridabad"},{"id":"5","name":"Fatehabad"},{"id":"6","name":"Gurgaon"},{"id":"7","name":"Hisar"},{"id":"8","name":"Jhajjar"},{"id":"9","name":"Jind"},{"id":"10","name":"Kaithal"},{"id":"11","name":"Karnal"},{"id":"12","name":"Kurukshetra"},{"id":"13","name":"Mahendragarh"},{"id":"14","name":"Mewat"},{"id":"15","name":"Palwal"},{"id":"16","name":"Panchkula"},{"id":"17","name":"Panipat"},{"id":"18","name":"Rewari"},{"id":"19","name":"Rohtak"},{"id":"20","name":"Sirsa"},{"id":"21","name":"Sonipat"},{"id":"22","name":"Yamunanagar"}],"id":"13","name":"Haryana","type":"State"},{"capital":"Shimla","code":"HP","coordinates":["77.1734","31.1048"],"districts":[{"id":"1","name":"Bilaspur"},{"id":"2","name":"Chamba"},{"id":"3","name":"Hamirpur"},{"id":"4","name":"Kangra"},{"id":"5","name":"Kinnaur"},{"id":"6","name":"Kullu"},{"id":"7","name":"Lahaul \\\\u0026amp; Spiti"},{"id":"8","name":"Mandi"},{"id":"9","name":"Shimla"},{"id":"10","name":"Sirmaur (Sirmour)"},{"id":"11","name":"Solan"},{"id":"12","name":"Una"}],"id":"14","name":"Himachal Pradesh","type":"State"},{"capital":"Jammu (Winter), Srinagar (Summer)","code":"JK","coordinates":["76.5762","33.7782"],"districts":[{"id":"1","name":"Anantnag"},{"id":"2","name":"Bandipore"},{"id":"3","name":"Baramulla"},{"id":"4","name":"Budgam"},{"id":"5","name":"Doda"},{"id":"6","name":"Ganderbal"},{"id":"7","name":"Jammu"},{"id":"8","name":"Kargil"},{"id":"9","name":"Kathua"},{"id":"10","name":"Kishtwar"},{"id":"11","name":"Kulgam"},{"id":"12","name":"Kupwara"},{"id":"13","name":"Leh"},{"id":"14","name":"Poonch"},{"id":"15","name":"Pulwama"},{"id":"16","name":"Rajouri"},{"id":"17","name":"Ramban"},{"id":"18","name":"Reasi"},{"id":"19","name":"Samba"},{"id":"20","name":"Shopian"},{"id":"21","name":"Srinagar"},{"id":"22","name":"Udhampur"}],"id":"15","name":"Jammu and Kashmir","type":"Union Territory"},{"capital":"Ranchi","code":"JH","coordinates":["85.2799","23.6102"],"districts":[{"id":"1","name":"Bokaro"},{"id":"2","name":"Chatra"},{"id":"3","name":"Deoghar"},{"id":"4","name":"Dhanbad"},{"id":"5","name":"Dumka"},{"id":"6","name":"East Singhbhum"},{"id":"7","name":"Garhwa"},{"id":"8","name":"Giridih"},{"id":"9","name":"Godda"},{"id":"10","name":"Gumla"},{"id":"11","name":"Hazaribag"},{"id":"12","name":"Jamtara"},{"id":"13","name":"Khunti"},{"id":"14","name":"Koderma"},{"id":"15","name":"Latehar"},{"id":"16","name":"Lohardaga"},{"id":"17","name":"Pakur"},{"id":"18","name":"Palamu"},{"id":"19","name":"Ramgarh"},{"id":"20","name":"Ranchi"},{"id":"21","name":"Sahibganj"},{"id":"22","name":"Seraikela-Kharsawan"},{"id":"23","name":"Simdega"},{"id":"24","name":"West Singhbhum"}],"id":"16","name":"Jharkhand","type":"State"},{"capital":"Bengaluru","code":"KA","coordinates":["75.7139","15.3173"],"districts":[{"id":"1","name":"Bagalkot"},{"id":"2","name":"Ballari (Bellary)"},{"id":"3","name":"Belagavi (Belgaum)"},{"id":"4","name":"Bengaluru (Bangalore) Rural"},{"id":"5","name":"Bengaluru (Bangalore) Urban"},{"id":"6","name":"Bidar"},{"id":"7","name":"Chamarajanagar"},{"id":"8","name":"Chikballapur"},{"id":"9","name":"Chikkamagaluru (Chikmagalur)"},{"id":"10","name":"Chitradurga"},{"id":"11","name":"Dakshina Kannada"},{"id":"12","name":"Davangere"},{"id":"13","name":"Dharwad"},{"id":"14","name":"Gadag"},{"id":"15","name":"Hassan"},{"id":"16","name":"Haveri"},{"id":"17","name":"Kalaburagi (Gulbarga)"},{"id":"18","name":"Kodagu"},{"id":"19","name":"Kolar"},{"id":"20","name":"Koppal"},{"id":"21","name":"Mandya"},{"id":"22","name":"Mysuru (Mysore)"},{"id":"23","name":"Raichur"},{"id":"24","name":"Ramanagara"},{"id":"25","name":"Shivamogga (Shimoga)"},{"id":"26","name":"Tumakuru (Tumkur)"},{"id":"27","name":"Udupi"},{"id":"28","name":"Uttara Kannada (Karwar)"},{"id":"29","name":"Vijayapura (Bijapur)"},{"id":"30","name":"Yadgir"}],"id":"17","name":"Karnataka","type":"State"},{"capital":"Thiruvananthapuram","code":"KL","coordinates":["76.2711","10.8505"],"districts":[{"id":"1","name":"Alappuzha"},{"id":"2","name":"Ernakulam"},{"id":"3","name":"Idukki"},{"id":"4","name":"Kannur"},{"id":"5","name":"Kasaragod"},{"id":"6","name":"Kollam"},{"id":"7","name":"Kottayam"},{"id":"8","name":"Kozhikode"},{"id":"9","name":"Malappuram"},{"id":"10","name":"Palakkad"},{"id":"11","name":"Pathanamthitta"},{"id":"12","name":"Thiruvananthapuram"},{"id":"13","name":"Thrissur"},{"id":"14","name":"Wayanad"}],"id":"18","name":"Kerala","type":"State"},{"capital":"Leh, Kargil","code":"LA","coordinates":["77.6151","34.2095"],"districts":[{"id":"1","name":"Kargil"},{"id":"2","name":"Leh"}],"id":"19","name":"Ladakh","type":"Union Territory"},{"capital":"Kavaratti","code":"LD","coordinates":["72.1833","13.7000"],"districts":[{"id":"1","name":"Agatti"},{"id":"2","name":"Amini"},{"id":"3","name":"Androth"},{"id":"4","name":"Bithra"},{"id":"5","name":"Chethlath"},{"id":"6","name":"Kavaratti"},{"id":"7","name":"Kadmath"},{"id":"8","name":"Kalpeni"},{"id":"9","name":"Kilthan"},{"id":"10","name":"Minicoy"}],"id":"20","name":"Lakshadweep","type":"Union Territory"},{"capital":"Bhopal","code":"MP","coordinates":["78.6569","22.9734"],"districts":[{"id":"1","name":"Agar Malwa"},{"id":"2","name":"Alirajpur"},{"id":"3","name":"Anuppur"},{"id":"4","name":"Ashoknagar"},{"id":"5","name":"Balaghat"},{"id":"6","name":"Barwani"},{"id":"7","name":"Betul"},{"id":"8","name":"Bhind"},{"id":"9","name":"Bhopal"},{"id":"10","name":"Burhanpur"},{"id":"11","name":"Chhatarpur"},{"id":"12","name":"Chhindwara"},{"id":"13","name":"Damoh"},{"id":"14","name":"Datia"},{"id":"15","name":"Dewas"},{"id":"16","name":"Dhar"},{"id":"17","name":"Dindori"},{"id":"18","name":"Guna"},{"id":"19","name":"Gwalior"},{"id":"20","name":"Harda"},{"id":"21","name":"Hoshangabad"},{"id":"22","name":"Indore"},{"id":"23","name":"Jabalpur"},{"id":"24","name":"Jhabua"},{"id":"25","name":"Katni"},{"id":"26","name":"Khandwa"},{"id":"27","name":"Khargone"},{"id":"28","name":"Mandla"},{"id":"29","name":"Mandsaur"},{"id":"30","name":"Morena"},{"id":"31","name":"Narsinghpur"},{"id":"32","name":"Neemuch"},{"id":"33","name":"Panna"},{"id":"34","name":"Raisen"},{"id":"35","name":"Rajgarh"},{"id":"36","name":"Ratlam"},{"id":"37","name":"Rewa"},{"id":"38","name":"Sagar"},{"id":"39","name":"Satna"},{"id":"40","name":"Sehore"},{"id":"41","name":"Seoni"},{"id":"42","name":"Shahdol"},{"id":"43","name":"Shajapur"},{"id":"44","name":"Sheopur"},{"id":"45","name":"Shivpuri"},{"id":"46","name":"Sidhi"},{"id":"47","name":"Singrauli"},{"id":"48","name":"Tikamgarh"},{"id":"49","name":"Ujjain"},{"id":"50","name":"Umaria"},{"id":"51","name":"Vidisha"}],"id":"21","name":"Madhya Pradesh","type":"State"},{"capital":"Mumbai","code":"MH","coordinates":["75.7139","19.7515"],"districts":[{"id":"1","name":"Ahmednagar"},{"id":"2","name":"Akola"},{"id":"3","name":"Amravati"},{"id":"4","name":"Aurangabad"},{"id":"5","name":"Beed"},{"id":"6","name":"Bhandara"},{"id":"7","name":"Buldhana"},{"id":"8","name":"Chandrapur"},{"id":"9","name":"Dhule"},{"id":"10","name":"Gadchiroli"},{"id":"11","name":"Gondia"},{"id":"12","name":"Hingoli"},{"id":"13","name":"Jalgaon"},{"id":"14","name":"Jalna"},{"id":"15","name":"Kolhapur"},{"id":"16","name":"Latur"},{"id":"17","name":"Mumbai City"},{"id":"18","name":"Mumbai Suburban"},{"id":"19","name":"Nagpur"},{"id":"20","name":"Nanded"},{"id":"21","name":"Nandurbar"},{"id":"22","name":"Nashik"},{"id":"23","name":"Osmanabad"},{"id":"24","name":"Palghar"},{"id":"25","name":"Parbhani"},{"id":"26","name":"Pune"},{"id":"27","name":"Raigad"},{"id":"28","name":"Ratnagiri"},{"id":"29","name":"Sangli"},{"id":"30","name":"Satara"},{"id":"31","name":"Sindhudurg"},{"id":"32","name":"Solapur"},{"id":"33","name":"Thane"},{"id":"34","name":"Wardha"},{"id":"35","name":"Washim"},{"id":"36","name":"Yavatmal"}],"id":"22","name":"Maharashtra","type":"State"},{"capital":"Imphal","code":"MN","coordinates":["93.9063","24.6637"],"districts":[{"id":"1","name":"Bishnupur"},{"id":"2","name":"Chandel"},{"id":"3","name":"Churachandpur"},{"id":"4","name":"Imphal East"},{"id":"5","name":"Imphal West"},{"id":"6","name":"Jiribam"},{"id":"7","name":"Kakching"},{"id":"8","name":"Kamjong"},{"id":"9","name":"Kangpokpi"},{"id":"10","name":"Noney"},{"id":"11","name":"Pherzawl"},{"id":"12","name":"Senapati"},{"id":"13","name":"Tamenglong"},{"id":"14","name":"Tengnoupal"},{"id":"15","name":"Thoubal"},{"id":"16","name":"Ukhrul"}],"id":"23","name":"Manipur","type":"State"},{"capital":"Shillong","code":"ML","coordinates":["91.3662","25.4670"],"districts":[{"id":"1","name":"East Garo Hills"},{"id":"2","name":"East Jaintia Hills"},{"id":"3","name":"East Khasi Hills"},{"id":"4","name":"North Garo Hills"},{"id":"5","name":"Ri Bhoi"},{"id":"6","name":"South Garo Hills"},{"id":"7","name":"South West Garo Hills "},{"id":"8","name":"South West Khasi Hills"},{"id":"9","name":"West Garo Hills"},{"id":"10","name":"West Jaintia Hills"},{"id":"11","name":"West Khasi Hills"}],"id":"24","name":"Meghalaya","type":"State"},{"capital":"Aizawl","code":"MZ","coordinates":["92.9376","23.1645"],"districts":[{"id":"1","name":"Aizawl"},{"id":"2","name":"Champhai"},{"id":"3","name":"Kolasib"},{"id":"4","name":"Lawngtlai"},{"id":"5","name":"Lunglei"},{"id":"6","name":"Mamit"},{"id":"7","name":"Saiha"},{"id":"8","name":"Serchhip"}],"id":"25","name":"Mizoram","type":"State"},{"capital":"Kohima","code":"NL","coordinates":["94.5624","26.1584"],"districts":[{"id":"1","name":"Dimapur"},{"id":"2","name":"Kiphire"},{"id":"3","name":"Kohima"},{"id":"4","name":"Longleng"},{"id":"5","name":"Mokokchung"},{"id":"6","name":"Mon"},{"id":"7","name":"Peren"},{"id":"8","name":"Phek"},{"id":"9","name":"Tuensang"},{"id":"10","name":"Wokha"},{"id":"11","name":"Zunheboto"}],"id":"26","name":"Nagaland","type":"State"},{"capital":"Bhubaneswar","code":"OR","coordinates":["85.0985","20.9517"],"districts":[{"id":"1","name":"Angul"},{"id":"2","name":"Balangir"},{"id":"3","name":"Balasore"},{"id":"4","name":"Bargarh"},{"id":"5","name":"Bhadrak"},{"id":"6","name":"Boudh"},{"id":"7","name":"Cuttack"},{"id":"8","name":"Deogarh"},{"id":"9","name":"Dhenkanal"},{"id":"10","name":"Gajapati"},{"id":"11","name":"Ganjam"},{"id":"12","name":"Jagatsinghapur"},{"id":"13","name":"Jajpur"},{"id":"14","name":"Jharsuguda"},{"id":"15","name":"Kalahandi"},{"id":"16","name":"Kandhamal"},{"id":"17","name":"Kendrapara"},{"id":"18","name":"Kendujhar (Keonjhar)"},{"id":"19","name":"Khordha"},{"id":"20","name":"Koraput"},{"id":"21","name":"Malkangiri"},{"id":"22","name":"Mayurbhanj"},{"id":"23","name":"Nabarangpur"},{"id":"24","name":"Nayagarh"},{"id":"25","name":"Nuapada"},{"id":"26","name":"Puri"},{"id":"27","name":"Rayagada"},{"id":"28","name":"Sambalpur"},{"id":"29","name":"Sonepur"},{"id":"30","name":"Sundargarh"}],"id":"27","name":"Odisha","type":"State"},{"capital":"Puducherry","code":"PY","coordinates":["79.8083","11.9416"],"districts":[{"id":"1","name":"Karaikal"},{"id":"2","name":"Mahe"},{"id":"3","name":"Pondicherry"},{"id":"4","name":"Yanam"}],"id":"28","name":"Puducherry","type":"Union Territory"},{"capital":"Chandigarh","code":"PB","coordinates":["75.3412","31.1471"],"districts":[{"id":"1","name":"Amritsar"},{"id":"2","name":"Barnala"},{"id":"3","name":"Bathinda"},{"id":"4","name":"Faridkot"},{"id":"5","name":"Fatehgarh Sahib"},{"id":"6","name":"Fazilka"},{"id":"7","name":"Ferozepur"},{"id":"8","name":"Gurdaspur"},{"id":"9","name":"Hoshiarpur"},{"id":"10","name":"Jalandhar"},{"id":"11","name":"Kapurthala"},{"id":"12","name":"Ludhiana"},{"id":"13","name":"Mansa"},{"id":"14","name":"Moga"},{"id":"15","name":"Muktsar"},{"id":"16","name":"Nawanshahr (Shahid Bhagat Singh Nagar)"},{"id":"17","name":"Pathankot"},{"id":"18","name":"Patiala"},{"id":"19","name":"Rupnagar"},{"id":"20","name":"Sahibzada Ajit Singh Nagar (Mohali)"},{"id":"21","name":"Sangrur"},{"id":"22","name":"Tarn Taran"}],"id":"29","name":"Punjab","type":"State"},{"capital":"Jaipur","code":"RJ","coordinates":["74.2179","27.0238"],"districts":[{"id":"1","name":"Ajmer"},{"id":"2","name":"Alwar"},{"id":"3","name":"Banswara"},{"id":"4","name":"Baran"},{"id":"5","name":"Barmer"},{"id":"6","name":"Bharatpur"},{"id":"7","name":"Bhilwara"},{"id":"8","name":"Bikaner"},{"id":"9","name":"Bundi"},{"id":"10","name":"Chittorgarh"},{"id":"11","name":"Churu"},{"id":"12","name":"Dausa"},{"id":"13","name":"Dholpur"},{"id":"14","name":"Dungarpur"},{"id":"15","name":"Hanumangarh"},{"id":"16","name":"Jaipur"},{"id":"17","name":"Jaisalmer"},{"id":"18","name":"Jalore"},{"id":"19","name":"Jhalawar"},{"id":"20","name":"Jhunjhunu"},{"id":"21","name":"Jodhpur"},{"id":"22","name":"Karauli"},{"id":"23","name":"Kota"},{"id":"24","name":"Nagaur"},{"id":"25","name":"Pali"},{"id":"26","name":"Pratapgarh"},{"id":"27","name":"Rajsamand"},{"id":"28","name":"Sawai Madhopur"},{"id":"29","name":"Sikar"},{"id":"30","name":"Sirohi"},{"id":"31","name":"Sri Ganganagar"},{"id":"32","name":"Tonk"},{"id":"33","name":"Udaipur"}],"id":"30","name":"Rajasthan","type":"State"},{"capital":"Gangtok","code":"SK","coordinates":["88.5122","27.5330"],"districts":[{"id":"1","name":"East Sikkim"},{"id":"2","name":"North Sikkim"},{"id":"3","name":"South Sikkim"},{"id":"4","name":"West Sikkim"}],"id":"31","name":"Sikkim","type":"State"},{"capital":"Chennai","code":"TN","coordinates":["78.6569","11.1271"],"districts":[{"id":"1","name":"Ariyalur"},{"id":"2","name":"Chennai"},{"id":"3","name":"Coimbatore"},{"id":"4","name":"Cuddalore"},{"id":"5","name":"Dharmapuri"},{"id":"6","name":"Dindigul"},{"id":"7","name":"Erode"},{"id":"8","name":"Kanchipuram"},{"id":"9","name":"Kanyakumari"},{"id":"10","name":"Karur"},{"id":"11","name":"Krishnagiri"},{"id":"12","name":"Madurai"},{"id":"13","name":"Nagapattinam"},{"id":"14","name":"Namakkal"},{"id":"15","name":"Nilgiris"},{"id":"16","name":"Perambalur"},{"id":"17","name":"Pudukkottai"},{"id":"18","name":"Ramanathapuram"},{"id":"19","name":"Salem"},{"id":"20","name":"Sivaganga"},{"id":"21","name":"Thanjavur"},{"id":"22","name":"Theni"},{"id":"23","name":"Thoothukudi (Tuticorin)"},{"id":"24","name":"Tiruchirappalli"},{"id":"25","name":"Tirunelveli"},{"id":"26","name":"Tiruppur"},{"id":"27","name":"Tiruvallur"},{"id":"28","name":"Tiruvannamalai"},{"id":"29","name":"Tiruvarur"},{"id":"30","name":"Vellore"},{"id":"31","name":"Viluppuram"},{"id":"32","name":"Virudhunagar"}],"id":"32","name":"Tamil Nadu","type":"State"},{"capital":"Hyderabad","code":"TS","coordinates":["79.0193","18.1124"],"districts":[{"id":"1","name":"Adilabad"},{"id":"2","name":"Bhadradri Kothagudem"},{"id":"3","name":"Hyderabad"},{"id":"4","name":"Jagtial"},{"id":"5","name":"Jangaon"},{"id":"6","name":"Jayashankar Bhoopalpally"},{"id":"7","name":"Jogulamba Gadwal"},{"id":"8","name":"Kamareddy"},{"id":"9","name":"Karimnagar"},{"id":"10","name":"Khammam"},{"id":"11","name":"Komaram Bheem Asifabad"},{"id":"12","name":"Mahabubabad"},{"id":"13","name":"Mahabubnagar"},{"id":"14","name":"Mancherial"},{"id":"15","name":"Medak"},{"id":"16","name":"Medchal"},{"id":"17","name":"Nagarkurnool"},{"id":"18","name":"Nalgonda"},{"id":"19","name":"Nirmal"},{"id":"20","name":"Nizamabad"},{"id":"21","name":"Peddapalli"},{"id":"22","name":"Rajanna Sircilla"},{"id":"23","name":"Rangareddy"},{"id":"24","name":"Sangareddy"},{"id":"25","name":"Siddipet"},{"id":"26","name":"Suryapet"},{"id":"27","name":"Vikarabad"},{"id":"28","name":"Wanaparthy"},{"id":"29","name":"Warangal (Rural)"},{"id":"30","name":"Warangal (Urban)"},{"id":"31","name":"Yadadri Bhuvanagiri"}],"id":"33","name":"Telangana","type":"State"},{"capital":"Agartala","code":"TR","coordinates":["91.9882","23.9408"],"districts":[{"id":"1","name":"Dhalai"},{"id":"2","name":"Gomati"},{"id":"3","name":"Khowai"},{"id":"4","name":"North Tripura"},{"id":"5","name":"Sepahijala"},{"id":"6","name":"South Tripura"},{"id":"7","name":"Unakoti"},{"id":"8","name":"West Tripura"}],"id":"34","name":"Tripura","type":"State"},{"capital":"Lucknow","code":"UP","coordinates":["80.9462","26.8467"],"districts":[{"id":"1","name":"Agra"},{"id":"2","name":"Aligarh"},{"id":"3","name":"Allahabad"},{"id":"4","name":"Ambedkar Nagar"},{"id":"5","name":"Amethi (Chatrapati Sahuji Mahraj Nagar)"},{"id":"6","name":"Amroha (J.P. Nagar)"},{"id":"7","name":"Auraiya"},{"id":"8","name":"Azamgarh"},{"id":"9","name":"Baghpat"},{"id":"10","name":"Bahraich"},{"id":"11","name":"Ballia"},{"id":"12","name":"Balrampur"},{"id":"13","name":"Banda"},{"id":"14","name":"Barabanki"},{"id":"15","name":"Bareilly"},{"id":"16","name":"Basti"},{"id":"17","name":"Bhadohi"},{"id":"18","name":"Bijnor"},{"id":"19","name":"Budaun"},{"id":"20","name":"Bulandshahr"},{"id":"21","name":"Chandauli"},{"id":"22","name":"Chitrakoot"},{"id":"23","name":"Deoria"},{"id":"24","name":"Etah"},{"id":"25","name":"Etawah"},{"id":"26","name":"Faizabad"},{"id":"27","name":"Farrukhabad"},{"id":"28","name":"Fatehpur"},{"id":"29","name":"Firozabad"},{"id":"30","name":"Gautam Buddha Nagar"},{"id":"31","name":"Ghaziabad"},{"id":"32","name":"Ghazipur"},{"id":"33","name":"Gonda"},{"id":"34","name":"Gorakhpur"},{"id":"35","name":"Hamirpur"},{"id":"36","name":"Hapur (Panchsheel Nagar)"},{"id":"37","name":"Hardoi"},{"id":"38","name":"Hathras"},{"id":"39","name":"Jalaun"},{"id":"40","name":"Jaunpur"},{"id":"41","name":"Jhansi"},{"id":"42","name":"Kannauj"},{"id":"43","name":"Kanpur Dehat"},{"id":"44","name":"Kanpur Nagar"},{"id":"45","name":"Kanshiram Nagar (Kasganj)"},{"id":"46","name":"Kaushambi"},{"id":"47","name":"Kushinagar (Padrauna)"},{"id":"48","name":"Lakhimpur - Kheri"},{"id":"49","name":"Lalitpur"},{"id":"50","name":"Lucknow"},{"id":"51","name":"Maharajganj"},{"id":"52","name":"Mahoba"},{"id":"53","name":"Mainpuri"},{"id":"54","name":"Mathura"},{"id":"55","name":"Mau"},{"id":"56","name":"Meerut"},{"id":"57","name":"Mirzapur"},{"id":"58","name":"Moradabad"},{"id":"59","name":"Muzaffarnagar"},{"id":"60","name":"Pilibhit"},{"id":"61","name":"Pratapgarh"},{"id":"62","name":"RaeBareli"},{"id":"63","name":"Rampur"},{"id":"64","name":"Saharanpur"},{"id":"65","name":"Sambhal (Bhim Nagar)"},{"id":"66","name":"Sant Kabir Nagar"},{"id":"67","name":"Shahjahanpur"},{"id":"68","name":"Shamali (Prabuddh Nagar)"},{"id":"69","name":"Shravasti"},{"id":"70","name":"Siddharth Nagar"},{"id":"71","name":"Sitapur"},{"id":"72","name":"Sonbhadra"},{"id":"73","name":"Sultanpur"},{"id":"74","name":"Unnao"},{"id":"75","name":"Varanasi"}],"id":"35","name":"Uttar Pradesh","type":"State"},{"capital":"Dehradun","code":"UK","coordinates":["78.0322","30.3165"],"districts":[{"id":"1","name":"Almora"},{"id":"2","name":"Bageshwar"},{"id":"3","name":"Chamoli"},{"id":"4","name":"Champawat"},{"id":"5","name":"Dehradun"},{"id":"6","name":"Haridwar"},{"id":"7","name":"Nainital"},{"id":"8","name":"Pauri Garhwal"},{"id":"9","name":"Pithoragarh"},{"id":"10","name":"Rudraprayag"},{"id":"11","name":"Tehri Garhwal"},{"id":"12","name":"Udham Singh Nagar"},{"id":"13","name":"Uttarkashi"}],"id":"36","name":"Uttarakhand","type":"State"},{"capital":"Kolkata","code":"WB","coordinates":["87.8550","22.9868"],"districts":[{"id":"1","name":"Alipurduar"},{"id":"2","name":"Bankura"},{"id":"3","name":"Birbhum"},{"id":"4","name":"Burdwan (Bardhaman)"},{"id":"5","name":"Cooch Behar"},{"id":"6","name":"Dakshin Dinajpur (South Dinajpur)"},{"id":"7","name":"Darjeeling"},{"id":"8","name":"Hooghly"},{"id":"9","name":"Howrah"},{"id":"10","name":"Jalpaiguri"},{"id":"11","name":"Kalimpong"},{"id":"12","name":"Kolkata"},{"id":"13","name":"Malda"},{"id":"14","name":"Murshidabad"},{"id":"15","name":"Nadia"},{"id":"16","name":"North 24 Parganas"},{"id":"17","name":"Paschim Medinipur (West Medinipur)"},{"id":"18","name":"Purba Medinipur (East Medinipur)"},{"id":"19","name":"Purulia"},{"id":"20","name":"South 24 Parganas"},{"id":"21","name":"Uttar Dinajpur (North Dinajpur)"}],"id":"37","name":"West Bengal","type":"State"}]}}}],"Tags":[],"SnapshotID":5,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
7	2021-10-12 11:00:53.916664+00	2021-10-12 11:00:53.916664+00	\N	1		{"ID":1,"CreatedAt":"2021-10-12T10:55:21.276696Z","UpdatedAt":"2021-10-12T11:00:47.117252Z","DeletedAt":null,"Key":"country_specific_features","Description":"country_specific_features","CreatedBy":"","UpdatedBy":"","Enabled":true,"Segments":[{"ID":1,"CreatedAt":"2021-10-12T11:00:47.098956Z","UpdatedAt":"2021-10-12T11:00:47.118565Z","DeletedAt":null,"FlagID":1,"Description":"default","Rank":999,"RolloutPercent":100,"Constraints":[],"Distributions":[{"ID":1,"CreatedAt":"2021-10-12T11:00:53.9037Z","UpdatedAt":"2021-10-12T11:00:53.9037Z","DeletedAt":null,"SegmentID":1,"VariantID":1,"VariantKey":"India","Percent":100}]}],"Variants":[{"ID":1,"CreatedAt":"2021-10-12T10:55:36.428592Z","UpdatedAt":"2021-10-12T11:00:47.119711Z","DeletedAt":null,"FlagID":1,"Key":"India","Attachment":{"applicationLogo":"","countryCode":"+91","countryName":"India","currency":"INR","nationalities":["India","Others"],"stateAndDistricts":{"states":[{"capital":"Mayabunder","code":"AN","coordinates":["92.6586","11.7401"],"districts":[{"id":"1","name":"Nicobar"},{"id":"2","name":"North and Middle Andaman"},{"id":"3","name":"South Andaman"}],"id":"1","name":"Andaman and Nicobar Islands","type":"Union Territory"},{"capital":"Amaravati","code":"AP","coordinates":["79.7400","15.9129"],"districts":[{"id":"1","name":"Anantapur"},{"id":"2","name":"Chittoor"},{"id":"3","name":"East Godavari"},{"id":"4","name":"Guntur"},{"id":"5","name":"Krishna"},{"id":"6","name":"Kurnool"},{"id":"7","name":"Nellore"},{"id":"8","name":"Prakasam"},{"id":"9","name":"Srikakulam"},{"id":"10","name":"Visakhapatnam"},{"id":"11","name":"Vizianagaram"},{"id":"12","name":"West Godavari"},{"id":"13","name":"YSR Kadapa"}],"id":"2","name":"Andhra Pradesh","type":"State"},{"capital":"Itanagar","code":"AR","coordinates":["94.7278","28.2180"],"districts":[{"id":"1","name":"Tawang"},{"id":"2","name":"West Kameng"},{"id":"3","name":"East Kameng"},{"id":"4","name":"Papum Pare"},{"id":"5","name":"Kurung Kumey"},{"id":"6","name":"Kra Daadi"},{"id":"7","name":"Lower Subansiri"},{"id":"8","name":"Upper Subansiri"},{"id":"9","name":"West Siang"},{"id":"10","name":"East Siang"},{"id":"11","name":"Siang"},{"id":"12","name":"Upper Siang"},{"id":"13","name":"Lower Siang"},{"id":"14","name":"Lower Dibang Valley"},{"id":"15","name":"Dibang Valley"},{"id":"16","name":"Anjaw"},{"id":"17","name":"Lohit"},{"id":"18","name":"Namsai"},{"id":"19","name":"Changlang"},{"id":"20","name":"Tirap"},{"id":"21","name":"Longding"}],"id":"3","name":"Arunachal Pradesh","type":"State"},{"capital":"Dispur","code":"AS","coordinates":["92.9376","26.2006"],"districts":[{"id":"1","name":"Baksa"},{"id":"2","name":"Barpeta"},{"id":"3","name":"Biswanath"},{"id":"4","name":"Bongaigaon"},{"id":"5","name":"Cachar"},{"id":"6","name":"Charaideo"},{"id":"7","name":"Chirang"},{"id":"8","name":"Darrang"},{"id":"9","name":"Dhemaji"},{"id":"10","name":"Dhubri"},{"id":"11","name":"Dibrugarh"},{"id":"12","name":"Goalpara"},{"id":"13","name":"Golaghat"},{"id":"14","name":"Hailakandi"},{"id":"15","name":"Hojai"},{"id":"16","name":"Jorhat"},{"id":"17","name":"Kamrup Metropolitan"},{"id":"18","name":"Kamrup"},{"id":"19","name":"Karbi Anglong"},{"id":"20","name":"Karimganj"},{"id":"21","name":"Kokrajhar"},{"id":"22","name":"Lakhimpur"},{"id":"23","name":"Majuli"},{"id":"24","name":"Morigaon"},{"id":"25","name":"Nagaon"},{"id":"26","name":"Nalbari"},{"id":"27","name":"Dima Hasao"},{"id":"28","name":"Sivasagar"},{"id":"29","name":"Sonitpur"},{"id":"30","name":"South Salmara-Mankachar"},{"id":"31","name":"Tinsukia"},{"id":"32","name":"Udalguri"},{"id":"33","name":"West Karbi Anglong"}],"id":"4","name":"Assam","type":"State"},{"capital":"Patna","code":"BR","coordinates":["85.3131","25.0961"],"districts":[{"id":"1","name":"Araria"},{"id":"2","name":"Arwal"},{"id":"3","name":"Aurangabad"},{"id":"4","name":"Banka"},{"id":"5","name":"Begusarai"},{"id":"6","name":"Bhagalpur"},{"id":"7","name":"Bhojpur"},{"id":"8","name":"Buxar"},{"id":"9","name":"Darbhanga"},{"id":"10","name":"East Champaran (Motihari)"},{"id":"11","name":"Gaya"},{"id":"12","name":"Gopalganj"},{"id":"13","name":"Jamui"},{"id":"14","name":"Jehanabad"},{"id":"15","name":"Kaimur (Bhabua)"},{"id":"16","name":"Katihar"},{"id":"17","name":"Khagaria"},{"id":"18","name":"Kishanganj"},{"id":"19","name":"Lakhisarai"},{"id":"20","name":"Madhepura"},{"id":"21","name":"Madhubani"},{"id":"22","name":"Munger (Monghyr)"},{"id":"23","name":"Muzaffarpur"},{"id":"24","name":"Nalanda"},{"id":"25","name":"Nawada"},{"id":"26","name":"Patna"},{"id":"27","name":"Purnia (Purnea)"},{"id":"28","name":"Rohtas"},{"id":"29","name":"Saharsa"},{"id":"30","name":"Samastipur"},{"id":"31","name":"Saran"},{"id":"32","name":"Sheikhpura"},{"id":"33","name":"Sheohar"},{"id":"34","name":"Sitamarhi"},{"id":"35","name":"Siwan"},{"id":"36","name":"Supaul"},{"id":"37","name":"Vaishali"},{"id":"38","name":"West Champaran"}],"id":"5","name":"Bihar","type":"State"},{"capital":"Chandigarh","code":"CG","coordinates":["76.7794","30.7333"],"districts":[{"id":"1","name":"Chandigarh"}],"id":"6","name":"Chandigarh","type":"Union Territory"},{"capital":"Bilaspur (Judiciary), Raipur","code":"CH","coordinates":["81.8661","21.2787"],"districts":[{"id":"1","name":"Balod"},{"id":"2","name":"Baloda Bazar"},{"id":"3","name":"Balrampur"},{"id":"4","name":"Bastar"},{"id":"5","name":"Bemetara"},{"id":"6","name":"Bijapur"},{"id":"7","name":"Bilaspur"},{"id":"8","name":"Dantewada (South Bastar)"},{"id":"9","name":"Dhamtari"},{"id":"10","name":"Durg"},{"id":"11","name":"Gariyaband"},{"id":"12","name":"Janjgir-Champa"},{"id":"13","name":"Jashpur"},{"id":"14","name":"Kabirdham (Kawardha)"},{"id":"15","name":"Kanker (North Bastar)"},{"id":"16","name":"Kondagaon"},{"id":"17","name":"Korba"},{"id":"18","name":"Korea (Koriya)"},{"id":"19","name":"Mahasamund"},{"id":"20","name":"Mungeli"},{"id":"21","name":"Narayanpur"},{"id":"22","name":"Raigarh"},{"id":"23","name":"Raipur"},{"id":"24","name":"Rajnandgaon"},{"id":"25","name":"Sukma"},{"id":"26","name":"Surajpur  "},{"id":"27","name":"Surguja"}],"id":"7","name":"Chhattisgarh","type":"State"},{"capital":"Silvassa","code":"DH","coordinates":["73.0169","20.1809"],"districts":[{"id":"1","name":"Dadra \\\\u0026 Nagar Haveli"}],"id":"8","name":"Dadra and Nagar Haveli","type":"Union Territory"},{"capital":"Daman","code":"DD","coordinates":["72.8397","20.4283"],"districts":[{"id":"1","name":"Daman"},{"id":"2","name":"Diu"}],"id":"9","name":"Daman and Diu","type":"Union Territory"},{"capital":"New Delhi","code":"DL","coordinates":["77.1025","28.7041"],"districts":[{"id":"1","name":"Central Delhi"},{"id":"2","name":"East Delhi"},{"id":"3","name":"New Delhi"},{"id":"4","name":"North Delhi"},{"id":"5","name":"North East  Delhi"},{"id":"6","name":"North West  Delhi"},{"id":"7","name":"Shahdara"},{"id":"8","name":"South Delhi"},{"id":"9","name":"South East Delhi"},{"id":"10","name":"South West  Delhi"},{"id":"11","name":"West Delhi"}],"id":"10","name":"Delhi","type":"National Capital Territory"},{"capital":"Panaji","code":"GA","coordinates":["74.1240","15.2993"],"districts":[{"id":"1","name":"North Goa"},{"id":"2","name":"South Goa"}],"id":"11","name":"Goa","type":"State"},{"capital":"Gandhinagar","code":"GJ","coordinates":["71.1924","22.2587"],"districts":[{"id":"1","name":"Ahmedabad"},{"id":"2","name":"Amreli"},{"id":"3","name":"Anand"},{"id":"4","name":"Aravalli"},{"id":"5","name":"Banaskantha (Palanpur)"},{"id":"6","name":"Bharuch"},{"id":"7","name":"Bhavnagar"},{"id":"8","name":"Botad"},{"id":"9","name":"Chhota Udepur"},{"id":"10","name":"Dahod"},{"id":"11","name":"Dangs (Ahwa)"},{"id":"12","name":"Devbhoomi Dwarka"},{"id":"13","name":"Gandhinagar"},{"id":"14","name":"Gir Somnath"},{"id":"15","name":"Jamnagar"},{"id":"16","name":"Junagadh"},{"id":"17","name":"Kachchh"},{"id":"18","name":"Kheda (Nadiad)"},{"id":"19","name":"Mahisagar"},{"id":"20","name":"Mehsana"},{"id":"21","name":"Morbi"},{"id":"22","name":"Narmada (Rajpipla)"},{"id":"23","name":"Navsari"},{"id":"24","name":"Panchmahal (Godhra)"},{"id":"25","name":"Patan"},{"id":"26","name":"Porbandar"},{"id":"27","name":"Rajkot"},{"id":"28","name":"Sabarkantha (Himmatnagar)"},{"id":"29","name":"Surat"},{"id":"30","name":"Surendranagar"},{"id":"31","name":"Tapi (Vyara)"},{"id":"32","name":"Vadodara"},{"id":"33","name":"Valsad"}],"id":"12","name":"Gujarat","type":"State"},{"capital":"Chandigarh","code":"HR","coordinates":["76.0856","29.0588"],"districts":[{"id":"1","name":"Ambala"},{"id":"2","name":"Bhiwani"},{"id":"3","name":"Charkhi Dadri"},{"id":"4","name":"Faridabad"},{"id":"5","name":"Fatehabad"},{"id":"6","name":"Gurgaon"},{"id":"7","name":"Hisar"},{"id":"8","name":"Jhajjar"},{"id":"9","name":"Jind"},{"id":"10","name":"Kaithal"},{"id":"11","name":"Karnal"},{"id":"12","name":"Kurukshetra"},{"id":"13","name":"Mahendragarh"},{"id":"14","name":"Mewat"},{"id":"15","name":"Palwal"},{"id":"16","name":"Panchkula"},{"id":"17","name":"Panipat"},{"id":"18","name":"Rewari"},{"id":"19","name":"Rohtak"},{"id":"20","name":"Sirsa"},{"id":"21","name":"Sonipat"},{"id":"22","name":"Yamunanagar"}],"id":"13","name":"Haryana","type":"State"},{"capital":"Shimla","code":"HP","coordinates":["77.1734","31.1048"],"districts":[{"id":"1","name":"Bilaspur"},{"id":"2","name":"Chamba"},{"id":"3","name":"Hamirpur"},{"id":"4","name":"Kangra"},{"id":"5","name":"Kinnaur"},{"id":"6","name":"Kullu"},{"id":"7","name":"Lahaul \\\\u0026amp; Spiti"},{"id":"8","name":"Mandi"},{"id":"9","name":"Shimla"},{"id":"10","name":"Sirmaur (Sirmour)"},{"id":"11","name":"Solan"},{"id":"12","name":"Una"}],"id":"14","name":"Himachal Pradesh","type":"State"},{"capital":"Jammu (Winter), Srinagar (Summer)","code":"JK","coordinates":["76.5762","33.7782"],"districts":[{"id":"1","name":"Anantnag"},{"id":"2","name":"Bandipore"},{"id":"3","name":"Baramulla"},{"id":"4","name":"Budgam"},{"id":"5","name":"Doda"},{"id":"6","name":"Ganderbal"},{"id":"7","name":"Jammu"},{"id":"8","name":"Kargil"},{"id":"9","name":"Kathua"},{"id":"10","name":"Kishtwar"},{"id":"11","name":"Kulgam"},{"id":"12","name":"Kupwara"},{"id":"13","name":"Leh"},{"id":"14","name":"Poonch"},{"id":"15","name":"Pulwama"},{"id":"16","name":"Rajouri"},{"id":"17","name":"Ramban"},{"id":"18","name":"Reasi"},{"id":"19","name":"Samba"},{"id":"20","name":"Shopian"},{"id":"21","name":"Srinagar"},{"id":"22","name":"Udhampur"}],"id":"15","name":"Jammu and Kashmir","type":"Union Territory"},{"capital":"Ranchi","code":"JH","coordinates":["85.2799","23.6102"],"districts":[{"id":"1","name":"Bokaro"},{"id":"2","name":"Chatra"},{"id":"3","name":"Deoghar"},{"id":"4","name":"Dhanbad"},{"id":"5","name":"Dumka"},{"id":"6","name":"East Singhbhum"},{"id":"7","name":"Garhwa"},{"id":"8","name":"Giridih"},{"id":"9","name":"Godda"},{"id":"10","name":"Gumla"},{"id":"11","name":"Hazaribag"},{"id":"12","name":"Jamtara"},{"id":"13","name":"Khunti"},{"id":"14","name":"Koderma"},{"id":"15","name":"Latehar"},{"id":"16","name":"Lohardaga"},{"id":"17","name":"Pakur"},{"id":"18","name":"Palamu"},{"id":"19","name":"Ramgarh"},{"id":"20","name":"Ranchi"},{"id":"21","name":"Sahibganj"},{"id":"22","name":"Seraikela-Kharsawan"},{"id":"23","name":"Simdega"},{"id":"24","name":"West Singhbhum"}],"id":"16","name":"Jharkhand","type":"State"},{"capital":"Bengaluru","code":"KA","coordinates":["75.7139","15.3173"],"districts":[{"id":"1","name":"Bagalkot"},{"id":"2","name":"Ballari (Bellary)"},{"id":"3","name":"Belagavi (Belgaum)"},{"id":"4","name":"Bengaluru (Bangalore) Rural"},{"id":"5","name":"Bengaluru (Bangalore) Urban"},{"id":"6","name":"Bidar"},{"id":"7","name":"Chamarajanagar"},{"id":"8","name":"Chikballapur"},{"id":"9","name":"Chikkamagaluru (Chikmagalur)"},{"id":"10","name":"Chitradurga"},{"id":"11","name":"Dakshina Kannada"},{"id":"12","name":"Davangere"},{"id":"13","name":"Dharwad"},{"id":"14","name":"Gadag"},{"id":"15","name":"Hassan"},{"id":"16","name":"Haveri"},{"id":"17","name":"Kalaburagi (Gulbarga)"},{"id":"18","name":"Kodagu"},{"id":"19","name":"Kolar"},{"id":"20","name":"Koppal"},{"id":"21","name":"Mandya"},{"id":"22","name":"Mysuru (Mysore)"},{"id":"23","name":"Raichur"},{"id":"24","name":"Ramanagara"},{"id":"25","name":"Shivamogga (Shimoga)"},{"id":"26","name":"Tumakuru (Tumkur)"},{"id":"27","name":"Udupi"},{"id":"28","name":"Uttara Kannada (Karwar)"},{"id":"29","name":"Vijayapura (Bijapur)"},{"id":"30","name":"Yadgir"}],"id":"17","name":"Karnataka","type":"State"},{"capital":"Thiruvananthapuram","code":"KL","coordinates":["76.2711","10.8505"],"districts":[{"id":"1","name":"Alappuzha"},{"id":"2","name":"Ernakulam"},{"id":"3","name":"Idukki"},{"id":"4","name":"Kannur"},{"id":"5","name":"Kasaragod"},{"id":"6","name":"Kollam"},{"id":"7","name":"Kottayam"},{"id":"8","name":"Kozhikode"},{"id":"9","name":"Malappuram"},{"id":"10","name":"Palakkad"},{"id":"11","name":"Pathanamthitta"},{"id":"12","name":"Thiruvananthapuram"},{"id":"13","name":"Thrissur"},{"id":"14","name":"Wayanad"}],"id":"18","name":"Kerala","type":"State"},{"capital":"Leh, Kargil","code":"LA","coordinates":["77.6151","34.2095"],"districts":[{"id":"1","name":"Kargil"},{"id":"2","name":"Leh"}],"id":"19","name":"Ladakh","type":"Union Territory"},{"capital":"Kavaratti","code":"LD","coordinates":["72.1833","13.7000"],"districts":[{"id":"1","name":"Agatti"},{"id":"2","name":"Amini"},{"id":"3","name":"Androth"},{"id":"4","name":"Bithra"},{"id":"5","name":"Chethlath"},{"id":"6","name":"Kavaratti"},{"id":"7","name":"Kadmath"},{"id":"8","name":"Kalpeni"},{"id":"9","name":"Kilthan"},{"id":"10","name":"Minicoy"}],"id":"20","name":"Lakshadweep","type":"Union Territory"},{"capital":"Bhopal","code":"MP","coordinates":["78.6569","22.9734"],"districts":[{"id":"1","name":"Agar Malwa"},{"id":"2","name":"Alirajpur"},{"id":"3","name":"Anuppur"},{"id":"4","name":"Ashoknagar"},{"id":"5","name":"Balaghat"},{"id":"6","name":"Barwani"},{"id":"7","name":"Betul"},{"id":"8","name":"Bhind"},{"id":"9","name":"Bhopal"},{"id":"10","name":"Burhanpur"},{"id":"11","name":"Chhatarpur"},{"id":"12","name":"Chhindwara"},{"id":"13","name":"Damoh"},{"id":"14","name":"Datia"},{"id":"15","name":"Dewas"},{"id":"16","name":"Dhar"},{"id":"17","name":"Dindori"},{"id":"18","name":"Guna"},{"id":"19","name":"Gwalior"},{"id":"20","name":"Harda"},{"id":"21","name":"Hoshangabad"},{"id":"22","name":"Indore"},{"id":"23","name":"Jabalpur"},{"id":"24","name":"Jhabua"},{"id":"25","name":"Katni"},{"id":"26","name":"Khandwa"},{"id":"27","name":"Khargone"},{"id":"28","name":"Mandla"},{"id":"29","name":"Mandsaur"},{"id":"30","name":"Morena"},{"id":"31","name":"Narsinghpur"},{"id":"32","name":"Neemuch"},{"id":"33","name":"Panna"},{"id":"34","name":"Raisen"},{"id":"35","name":"Rajgarh"},{"id":"36","name":"Ratlam"},{"id":"37","name":"Rewa"},{"id":"38","name":"Sagar"},{"id":"39","name":"Satna"},{"id":"40","name":"Sehore"},{"id":"41","name":"Seoni"},{"id":"42","name":"Shahdol"},{"id":"43","name":"Shajapur"},{"id":"44","name":"Sheopur"},{"id":"45","name":"Shivpuri"},{"id":"46","name":"Sidhi"},{"id":"47","name":"Singrauli"},{"id":"48","name":"Tikamgarh"},{"id":"49","name":"Ujjain"},{"id":"50","name":"Umaria"},{"id":"51","name":"Vidisha"}],"id":"21","name":"Madhya Pradesh","type":"State"},{"capital":"Mumbai","code":"MH","coordinates":["75.7139","19.7515"],"districts":[{"id":"1","name":"Ahmednagar"},{"id":"2","name":"Akola"},{"id":"3","name":"Amravati"},{"id":"4","name":"Aurangabad"},{"id":"5","name":"Beed"},{"id":"6","name":"Bhandara"},{"id":"7","name":"Buldhana"},{"id":"8","name":"Chandrapur"},{"id":"9","name":"Dhule"},{"id":"10","name":"Gadchiroli"},{"id":"11","name":"Gondia"},{"id":"12","name":"Hingoli"},{"id":"13","name":"Jalgaon"},{"id":"14","name":"Jalna"},{"id":"15","name":"Kolhapur"},{"id":"16","name":"Latur"},{"id":"17","name":"Mumbai City"},{"id":"18","name":"Mumbai Suburban"},{"id":"19","name":"Nagpur"},{"id":"20","name":"Nanded"},{"id":"21","name":"Nandurbar"},{"id":"22","name":"Nashik"},{"id":"23","name":"Osmanabad"},{"id":"24","name":"Palghar"},{"id":"25","name":"Parbhani"},{"id":"26","name":"Pune"},{"id":"27","name":"Raigad"},{"id":"28","name":"Ratnagiri"},{"id":"29","name":"Sangli"},{"id":"30","name":"Satara"},{"id":"31","name":"Sindhudurg"},{"id":"32","name":"Solapur"},{"id":"33","name":"Thane"},{"id":"34","name":"Wardha"},{"id":"35","name":"Washim"},{"id":"36","name":"Yavatmal"}],"id":"22","name":"Maharashtra","type":"State"},{"capital":"Imphal","code":"MN","coordinates":["93.9063","24.6637"],"districts":[{"id":"1","name":"Bishnupur"},{"id":"2","name":"Chandel"},{"id":"3","name":"Churachandpur"},{"id":"4","name":"Imphal East"},{"id":"5","name":"Imphal West"},{"id":"6","name":"Jiribam"},{"id":"7","name":"Kakching"},{"id":"8","name":"Kamjong"},{"id":"9","name":"Kangpokpi"},{"id":"10","name":"Noney"},{"id":"11","name":"Pherzawl"},{"id":"12","name":"Senapati"},{"id":"13","name":"Tamenglong"},{"id":"14","name":"Tengnoupal"},{"id":"15","name":"Thoubal"},{"id":"16","name":"Ukhrul"}],"id":"23","name":"Manipur","type":"State"},{"capital":"Shillong","code":"ML","coordinates":["91.3662","25.4670"],"districts":[{"id":"1","name":"East Garo Hills"},{"id":"2","name":"East Jaintia Hills"},{"id":"3","name":"East Khasi Hills"},{"id":"4","name":"North Garo Hills"},{"id":"5","name":"Ri Bhoi"},{"id":"6","name":"South Garo Hills"},{"id":"7","name":"South West Garo Hills "},{"id":"8","name":"South West Khasi Hills"},{"id":"9","name":"West Garo Hills"},{"id":"10","name":"West Jaintia Hills"},{"id":"11","name":"West Khasi Hills"}],"id":"24","name":"Meghalaya","type":"State"},{"capital":"Aizawl","code":"MZ","coordinates":["92.9376","23.1645"],"districts":[{"id":"1","name":"Aizawl"},{"id":"2","name":"Champhai"},{"id":"3","name":"Kolasib"},{"id":"4","name":"Lawngtlai"},{"id":"5","name":"Lunglei"},{"id":"6","name":"Mamit"},{"id":"7","name":"Saiha"},{"id":"8","name":"Serchhip"}],"id":"25","name":"Mizoram","type":"State"},{"capital":"Kohima","code":"NL","coordinates":["94.5624","26.1584"],"districts":[{"id":"1","name":"Dimapur"},{"id":"2","name":"Kiphire"},{"id":"3","name":"Kohima"},{"id":"4","name":"Longleng"},{"id":"5","name":"Mokokchung"},{"id":"6","name":"Mon"},{"id":"7","name":"Peren"},{"id":"8","name":"Phek"},{"id":"9","name":"Tuensang"},{"id":"10","name":"Wokha"},{"id":"11","name":"Zunheboto"}],"id":"26","name":"Nagaland","type":"State"},{"capital":"Bhubaneswar","code":"OR","coordinates":["85.0985","20.9517"],"districts":[{"id":"1","name":"Angul"},{"id":"2","name":"Balangir"},{"id":"3","name":"Balasore"},{"id":"4","name":"Bargarh"},{"id":"5","name":"Bhadrak"},{"id":"6","name":"Boudh"},{"id":"7","name":"Cuttack"},{"id":"8","name":"Deogarh"},{"id":"9","name":"Dhenkanal"},{"id":"10","name":"Gajapati"},{"id":"11","name":"Ganjam"},{"id":"12","name":"Jagatsinghapur"},{"id":"13","name":"Jajpur"},{"id":"14","name":"Jharsuguda"},{"id":"15","name":"Kalahandi"},{"id":"16","name":"Kandhamal"},{"id":"17","name":"Kendrapara"},{"id":"18","name":"Kendujhar (Keonjhar)"},{"id":"19","name":"Khordha"},{"id":"20","name":"Koraput"},{"id":"21","name":"Malkangiri"},{"id":"22","name":"Mayurbhanj"},{"id":"23","name":"Nabarangpur"},{"id":"24","name":"Nayagarh"},{"id":"25","name":"Nuapada"},{"id":"26","name":"Puri"},{"id":"27","name":"Rayagada"},{"id":"28","name":"Sambalpur"},{"id":"29","name":"Sonepur"},{"id":"30","name":"Sundargarh"}],"id":"27","name":"Odisha","type":"State"},{"capital":"Puducherry","code":"PY","coordinates":["79.8083","11.9416"],"districts":[{"id":"1","name":"Karaikal"},{"id":"2","name":"Mahe"},{"id":"3","name":"Pondicherry"},{"id":"4","name":"Yanam"}],"id":"28","name":"Puducherry","type":"Union Territory"},{"capital":"Chandigarh","code":"PB","coordinates":["75.3412","31.1471"],"districts":[{"id":"1","name":"Amritsar"},{"id":"2","name":"Barnala"},{"id":"3","name":"Bathinda"},{"id":"4","name":"Faridkot"},{"id":"5","name":"Fatehgarh Sahib"},{"id":"6","name":"Fazilka"},{"id":"7","name":"Ferozepur"},{"id":"8","name":"Gurdaspur"},{"id":"9","name":"Hoshiarpur"},{"id":"10","name":"Jalandhar"},{"id":"11","name":"Kapurthala"},{"id":"12","name":"Ludhiana"},{"id":"13","name":"Mansa"},{"id":"14","name":"Moga"},{"id":"15","name":"Muktsar"},{"id":"16","name":"Nawanshahr (Shahid Bhagat Singh Nagar)"},{"id":"17","name":"Pathankot"},{"id":"18","name":"Patiala"},{"id":"19","name":"Rupnagar"},{"id":"20","name":"Sahibzada Ajit Singh Nagar (Mohali)"},{"id":"21","name":"Sangrur"},{"id":"22","name":"Tarn Taran"}],"id":"29","name":"Punjab","type":"State"},{"capital":"Jaipur","code":"RJ","coordinates":["74.2179","27.0238"],"districts":[{"id":"1","name":"Ajmer"},{"id":"2","name":"Alwar"},{"id":"3","name":"Banswara"},{"id":"4","name":"Baran"},{"id":"5","name":"Barmer"},{"id":"6","name":"Bharatpur"},{"id":"7","name":"Bhilwara"},{"id":"8","name":"Bikaner"},{"id":"9","name":"Bundi"},{"id":"10","name":"Chittorgarh"},{"id":"11","name":"Churu"},{"id":"12","name":"Dausa"},{"id":"13","name":"Dholpur"},{"id":"14","name":"Dungarpur"},{"id":"15","name":"Hanumangarh"},{"id":"16","name":"Jaipur"},{"id":"17","name":"Jaisalmer"},{"id":"18","name":"Jalore"},{"id":"19","name":"Jhalawar"},{"id":"20","name":"Jhunjhunu"},{"id":"21","name":"Jodhpur"},{"id":"22","name":"Karauli"},{"id":"23","name":"Kota"},{"id":"24","name":"Nagaur"},{"id":"25","name":"Pali"},{"id":"26","name":"Pratapgarh"},{"id":"27","name":"Rajsamand"},{"id":"28","name":"Sawai Madhopur"},{"id":"29","name":"Sikar"},{"id":"30","name":"Sirohi"},{"id":"31","name":"Sri Ganganagar"},{"id":"32","name":"Tonk"},{"id":"33","name":"Udaipur"}],"id":"30","name":"Rajasthan","type":"State"},{"capital":"Gangtok","code":"SK","coordinates":["88.5122","27.5330"],"districts":[{"id":"1","name":"East Sikkim"},{"id":"2","name":"North Sikkim"},{"id":"3","name":"South Sikkim"},{"id":"4","name":"West Sikkim"}],"id":"31","name":"Sikkim","type":"State"},{"capital":"Chennai","code":"TN","coordinates":["78.6569","11.1271"],"districts":[{"id":"1","name":"Ariyalur"},{"id":"2","name":"Chennai"},{"id":"3","name":"Coimbatore"},{"id":"4","name":"Cuddalore"},{"id":"5","name":"Dharmapuri"},{"id":"6","name":"Dindigul"},{"id":"7","name":"Erode"},{"id":"8","name":"Kanchipuram"},{"id":"9","name":"Kanyakumari"},{"id":"10","name":"Karur"},{"id":"11","name":"Krishnagiri"},{"id":"12","name":"Madurai"},{"id":"13","name":"Nagapattinam"},{"id":"14","name":"Namakkal"},{"id":"15","name":"Nilgiris"},{"id":"16","name":"Perambalur"},{"id":"17","name":"Pudukkottai"},{"id":"18","name":"Ramanathapuram"},{"id":"19","name":"Salem"},{"id":"20","name":"Sivaganga"},{"id":"21","name":"Thanjavur"},{"id":"22","name":"Theni"},{"id":"23","name":"Thoothukudi (Tuticorin)"},{"id":"24","name":"Tiruchirappalli"},{"id":"25","name":"Tirunelveli"},{"id":"26","name":"Tiruppur"},{"id":"27","name":"Tiruvallur"},{"id":"28","name":"Tiruvannamalai"},{"id":"29","name":"Tiruvarur"},{"id":"30","name":"Vellore"},{"id":"31","name":"Viluppuram"},{"id":"32","name":"Virudhunagar"}],"id":"32","name":"Tamil Nadu","type":"State"},{"capital":"Hyderabad","code":"TS","coordinates":["79.0193","18.1124"],"districts":[{"id":"1","name":"Adilabad"},{"id":"2","name":"Bhadradri Kothagudem"},{"id":"3","name":"Hyderabad"},{"id":"4","name":"Jagtial"},{"id":"5","name":"Jangaon"},{"id":"6","name":"Jayashankar Bhoopalpally"},{"id":"7","name":"Jogulamba Gadwal"},{"id":"8","name":"Kamareddy"},{"id":"9","name":"Karimnagar"},{"id":"10","name":"Khammam"},{"id":"11","name":"Komaram Bheem Asifabad"},{"id":"12","name":"Mahabubabad"},{"id":"13","name":"Mahabubnagar"},{"id":"14","name":"Mancherial"},{"id":"15","name":"Medak"},{"id":"16","name":"Medchal"},{"id":"17","name":"Nagarkurnool"},{"id":"18","name":"Nalgonda"},{"id":"19","name":"Nirmal"},{"id":"20","name":"Nizamabad"},{"id":"21","name":"Peddapalli"},{"id":"22","name":"Rajanna Sircilla"},{"id":"23","name":"Rangareddy"},{"id":"24","name":"Sangareddy"},{"id":"25","name":"Siddipet"},{"id":"26","name":"Suryapet"},{"id":"27","name":"Vikarabad"},{"id":"28","name":"Wanaparthy"},{"id":"29","name":"Warangal (Rural)"},{"id":"30","name":"Warangal (Urban)"},{"id":"31","name":"Yadadri Bhuvanagiri"}],"id":"33","name":"Telangana","type":"State"},{"capital":"Agartala","code":"TR","coordinates":["91.9882","23.9408"],"districts":[{"id":"1","name":"Dhalai"},{"id":"2","name":"Gomati"},{"id":"3","name":"Khowai"},{"id":"4","name":"North Tripura"},{"id":"5","name":"Sepahijala"},{"id":"6","name":"South Tripura"},{"id":"7","name":"Unakoti"},{"id":"8","name":"West Tripura"}],"id":"34","name":"Tripura","type":"State"},{"capital":"Lucknow","code":"UP","coordinates":["80.9462","26.8467"],"districts":[{"id":"1","name":"Agra"},{"id":"2","name":"Aligarh"},{"id":"3","name":"Allahabad"},{"id":"4","name":"Ambedkar Nagar"},{"id":"5","name":"Amethi (Chatrapati Sahuji Mahraj Nagar)"},{"id":"6","name":"Amroha (J.P. Nagar)"},{"id":"7","name":"Auraiya"},{"id":"8","name":"Azamgarh"},{"id":"9","name":"Baghpat"},{"id":"10","name":"Bahraich"},{"id":"11","name":"Ballia"},{"id":"12","name":"Balrampur"},{"id":"13","name":"Banda"},{"id":"14","name":"Barabanki"},{"id":"15","name":"Bareilly"},{"id":"16","name":"Basti"},{"id":"17","name":"Bhadohi"},{"id":"18","name":"Bijnor"},{"id":"19","name":"Budaun"},{"id":"20","name":"Bulandshahr"},{"id":"21","name":"Chandauli"},{"id":"22","name":"Chitrakoot"},{"id":"23","name":"Deoria"},{"id":"24","name":"Etah"},{"id":"25","name":"Etawah"},{"id":"26","name":"Faizabad"},{"id":"27","name":"Farrukhabad"},{"id":"28","name":"Fatehpur"},{"id":"29","name":"Firozabad"},{"id":"30","name":"Gautam Buddha Nagar"},{"id":"31","name":"Ghaziabad"},{"id":"32","name":"Ghazipur"},{"id":"33","name":"Gonda"},{"id":"34","name":"Gorakhpur"},{"id":"35","name":"Hamirpur"},{"id":"36","name":"Hapur (Panchsheel Nagar)"},{"id":"37","name":"Hardoi"},{"id":"38","name":"Hathras"},{"id":"39","name":"Jalaun"},{"id":"40","name":"Jaunpur"},{"id":"41","name":"Jhansi"},{"id":"42","name":"Kannauj"},{"id":"43","name":"Kanpur Dehat"},{"id":"44","name":"Kanpur Nagar"},{"id":"45","name":"Kanshiram Nagar (Kasganj)"},{"id":"46","name":"Kaushambi"},{"id":"47","name":"Kushinagar (Padrauna)"},{"id":"48","name":"Lakhimpur - Kheri"},{"id":"49","name":"Lalitpur"},{"id":"50","name":"Lucknow"},{"id":"51","name":"Maharajganj"},{"id":"52","name":"Mahoba"},{"id":"53","name":"Mainpuri"},{"id":"54","name":"Mathura"},{"id":"55","name":"Mau"},{"id":"56","name":"Meerut"},{"id":"57","name":"Mirzapur"},{"id":"58","name":"Moradabad"},{"id":"59","name":"Muzaffarnagar"},{"id":"60","name":"Pilibhit"},{"id":"61","name":"Pratapgarh"},{"id":"62","name":"RaeBareli"},{"id":"63","name":"Rampur"},{"id":"64","name":"Saharanpur"},{"id":"65","name":"Sambhal (Bhim Nagar)"},{"id":"66","name":"Sant Kabir Nagar"},{"id":"67","name":"Shahjahanpur"},{"id":"68","name":"Shamali (Prabuddh Nagar)"},{"id":"69","name":"Shravasti"},{"id":"70","name":"Siddharth Nagar"},{"id":"71","name":"Sitapur"},{"id":"72","name":"Sonbhadra"},{"id":"73","name":"Sultanpur"},{"id":"74","name":"Unnao"},{"id":"75","name":"Varanasi"}],"id":"35","name":"Uttar Pradesh","type":"State"},{"capital":"Dehradun","code":"UK","coordinates":["78.0322","30.3165"],"districts":[{"id":"1","name":"Almora"},{"id":"2","name":"Bageshwar"},{"id":"3","name":"Chamoli"},{"id":"4","name":"Champawat"},{"id":"5","name":"Dehradun"},{"id":"6","name":"Haridwar"},{"id":"7","name":"Nainital"},{"id":"8","name":"Pauri Garhwal"},{"id":"9","name":"Pithoragarh"},{"id":"10","name":"Rudraprayag"},{"id":"11","name":"Tehri Garhwal"},{"id":"12","name":"Udham Singh Nagar"},{"id":"13","name":"Uttarkashi"}],"id":"36","name":"Uttarakhand","type":"State"},{"capital":"Kolkata","code":"WB","coordinates":["87.8550","22.9868"],"districts":[{"id":"1","name":"Alipurduar"},{"id":"2","name":"Bankura"},{"id":"3","name":"Birbhum"},{"id":"4","name":"Burdwan (Bardhaman)"},{"id":"5","name":"Cooch Behar"},{"id":"6","name":"Dakshin Dinajpur (South Dinajpur)"},{"id":"7","name":"Darjeeling"},{"id":"8","name":"Hooghly"},{"id":"9","name":"Howrah"},{"id":"10","name":"Jalpaiguri"},{"id":"11","name":"Kalimpong"},{"id":"12","name":"Kolkata"},{"id":"13","name":"Malda"},{"id":"14","name":"Murshidabad"},{"id":"15","name":"Nadia"},{"id":"16","name":"North 24 Parganas"},{"id":"17","name":"Paschim Medinipur (West Medinipur)"},{"id":"18","name":"Purba Medinipur (East Medinipur)"},{"id":"19","name":"Purulia"},{"id":"20","name":"South 24 Parganas"},{"id":"21","name":"Uttar Dinajpur (North Dinajpur)"}],"id":"37","name":"West Bengal","type":"State"}]}}}],"Tags":[],"SnapshotID":6,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
8	2021-10-12 11:01:27.340463+00	2021-10-12 11:01:27.340463+00	\N	2		{"ID":2,"CreatedAt":"2021-10-12T11:01:27.333264Z","UpdatedAt":"2021-10-12T11:01:27.333264Z","DeletedAt":null,"Key":"k4t7ahobcobark5e1","Description":"programs","CreatedBy":"","UpdatedBy":"","Enabled":false,"Segments":[],"Variants":[],"Tags":[],"SnapshotID":0,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
9	2021-10-12 11:01:33.524787+00	2021-10-12 11:01:33.524787+00	\N	2		{"ID":2,"CreatedAt":"2021-10-12T11:01:27.333264Z","UpdatedAt":"2021-10-12T11:01:33.51134Z","DeletedAt":null,"Key":"programs","Description":"programs","CreatedBy":"","UpdatedBy":"","Enabled":false,"Segments":[],"Variants":[],"Tags":[],"SnapshotID":8,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
10	2021-10-12 11:01:34.335822+00	2021-10-12 11:01:34.335822+00	\N	2		{"ID":2,"CreatedAt":"2021-10-12T11:01:27.333264Z","UpdatedAt":"2021-10-12T11:01:34.328086Z","DeletedAt":null,"Key":"programs","Description":"programs","CreatedBy":"","UpdatedBy":"","Enabled":true,"Segments":[],"Variants":[],"Tags":[],"SnapshotID":9,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
11	2021-10-12 11:01:47.934882+00	2021-10-12 11:01:47.934882+00	\N	2		{"ID":2,"CreatedAt":"2021-10-12T11:01:27.333264Z","UpdatedAt":"2021-10-12T11:01:34.336678Z","DeletedAt":null,"Key":"programs","Description":"programs","CreatedBy":"","UpdatedBy":"","Enabled":true,"Segments":[],"Variants":[{"ID":2,"CreatedAt":"2021-10-12T11:01:47.925772Z","UpdatedAt":"2021-10-12T11:01:47.925772Z","DeletedAt":null,"FlagID":2,"Key":"acbf8b77-5bac-4284-97c2-3bff8d94fe2f","Attachment":{}}],"Tags":[],"SnapshotID":10,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
12	2021-10-12 11:01:53.134863+00	2021-10-12 11:01:53.134863+00	\N	2		{"ID":2,"CreatedAt":"2021-10-12T11:01:27.333264Z","UpdatedAt":"2021-10-12T11:01:47.936083Z","DeletedAt":null,"Key":"programs","Description":"programs","CreatedBy":"","UpdatedBy":"","Enabled":true,"Segments":[],"Variants":[{"ID":2,"CreatedAt":"2021-10-12T11:01:47.925772Z","UpdatedAt":"2021-10-12T11:01:53.125469Z","DeletedAt":null,"FlagID":2,"Key":"acbf8b77-5bac-4284-97c2-3bff8d94fe2f","Attachment":{"commorbidities":["Heart Failure with hospital admission in past one year","Post Cardiac Transplant/Left Ventricular Assist Device (LVAD)","Significant Left ventricular systolic dysfunction (LVEF \\\\u003c40%)","Moderate or Severe Valvular Heart Disease","Congenital heart disease with severe PAH or Idiopathic PAH","Coronary Artery Disease with past CABG/PTCA/MI AND Hypertension/Diabetes on treatment","Angina AND Hypertension/Diabetes on treatment","CT/MRI documented stroke AND Hypertension/Diabetes on treatment","Pulmonary artery hypertension AND Hypertension/Diabetes on treatment","Diabetes (\\\\u003e 10 years OR with complications) AND Hypertension on treatment","Kidney/ Liver/ Hematopoietic stem cell transplant: Recipient/On wait-list","End Stage Kidney Disease on haemodialysis/ CAPD","Current prolonged use of oral corticosteroids/ immunosuppressant medications","Decompensated cirrhosis","Severe respiratory disease with hospitalizations in last two years/FEV1 \\\\u003c50%","Lymphoma/ Leukaemia/ Myeloma","Diagnosis of any solid cancer on or after 1st July 2020 OR currently on any cancer therapy","Sickle Cell Disease/ Bone marrow failure/ Aplastic Anaemia/ Thalassemia Major","Primary Immunodeficiency Diseases/ HIV infection","Persons with disabilities due to Intellectual disabilities/ Muscular Dystrophy/ Acid attack with involvement of respiratory system/ Persons with disabilities having high support needs/ Multiple disabilities including deaf-blindness"],"maxAge":120,"minAge":50}}],"Tags":[],"SnapshotID":11,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
13	2021-10-12 11:02:03.852524+00	2021-10-12 11:02:03.852524+00	\N	2		{"ID":2,"CreatedAt":"2021-10-12T11:01:27.333264Z","UpdatedAt":"2021-10-12T11:01:53.136406Z","DeletedAt":null,"Key":"programs","Description":"programs","CreatedBy":"","UpdatedBy":"","Enabled":true,"Segments":[{"ID":2,"CreatedAt":"2021-10-12T11:02:03.841636Z","UpdatedAt":"2021-10-12T11:02:03.841636Z","DeletedAt":null,"FlagID":2,"Description":"acbf8b77-5bac-4284-97c2-3bff8d94fe2f","Rank":999,"RolloutPercent":100,"Constraints":[],"Distributions":[]}],"Variants":[{"ID":2,"CreatedAt":"2021-10-12T11:01:47.925772Z","UpdatedAt":"2021-10-12T11:01:53.137852Z","DeletedAt":null,"FlagID":2,"Key":"acbf8b77-5bac-4284-97c2-3bff8d94fe2f","Attachment":{"commorbidities":["Heart Failure with hospital admission in past one year","Post Cardiac Transplant/Left Ventricular Assist Device (LVAD)","Significant Left ventricular systolic dysfunction (LVEF \\\\u003c40%)","Moderate or Severe Valvular Heart Disease","Congenital heart disease with severe PAH or Idiopathic PAH","Coronary Artery Disease with past CABG/PTCA/MI AND Hypertension/Diabetes on treatment","Angina AND Hypertension/Diabetes on treatment","CT/MRI documented stroke AND Hypertension/Diabetes on treatment","Pulmonary artery hypertension AND Hypertension/Diabetes on treatment","Diabetes (\\\\u003e 10 years OR with complications) AND Hypertension on treatment","Kidney/ Liver/ Hematopoietic stem cell transplant: Recipient/On wait-list","End Stage Kidney Disease on haemodialysis/ CAPD","Current prolonged use of oral corticosteroids/ immunosuppressant medications","Decompensated cirrhosis","Severe respiratory disease with hospitalizations in last two years/FEV1 \\\\u003c50%","Lymphoma/ Leukaemia/ Myeloma","Diagnosis of any solid cancer on or after 1st July 2020 OR currently on any cancer therapy","Sickle Cell Disease/ Bone marrow failure/ Aplastic Anaemia/ Thalassemia Major","Primary Immunodeficiency Diseases/ HIV infection","Persons with disabilities due to Intellectual disabilities/ Muscular Dystrophy/ Acid attack with involvement of respiratory system/ Persons with disabilities having high support needs/ Multiple disabilities including deaf-blindness"],"maxAge":120,"minAge":50}}],"Tags":[],"SnapshotID":12,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
16	2021-10-12 11:02:29.262155+00	2021-10-12 11:02:29.262155+00	\N	3		{"ID":3,"CreatedAt":"2021-10-12T11:02:24.605612Z","UpdatedAt":"2021-10-12T11:02:29.247633Z","DeletedAt":null,"Key":"notification_templates","Description":"notification_templates","CreatedBy":"","UpdatedBy":"","Enabled":false,"Segments":[],"Variants":[],"Tags":[],"SnapshotID":15,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
14	2021-10-12 11:02:10.873318+00	2021-10-12 11:02:10.873318+00	\N	2		{"ID":2,"CreatedAt":"2021-10-12T11:01:27.333264Z","UpdatedAt":"2021-10-12T11:02:03.853767Z","DeletedAt":null,"Key":"programs","Description":"programs","CreatedBy":"","UpdatedBy":"","Enabled":true,"Segments":[{"ID":2,"CreatedAt":"2021-10-12T11:02:03.841636Z","UpdatedAt":"2021-10-12T11:02:03.854766Z","DeletedAt":null,"FlagID":2,"Description":"acbf8b77-5bac-4284-97c2-3bff8d94fe2f","Rank":999,"RolloutPercent":100,"Constraints":[],"Distributions":[{"ID":2,"CreatedAt":"2021-10-12T11:02:10.860589Z","UpdatedAt":"2021-10-12T11:02:10.860589Z","DeletedAt":null,"SegmentID":2,"VariantID":2,"VariantKey":"acbf8b77-5bac-4284-97c2-3bff8d94fe2f","Percent":100}]}],"Variants":[{"ID":2,"CreatedAt":"2021-10-12T11:01:47.925772Z","UpdatedAt":"2021-10-12T11:02:03.855907Z","DeletedAt":null,"FlagID":2,"Key":"acbf8b77-5bac-4284-97c2-3bff8d94fe2f","Attachment":{"commorbidities":["Heart Failure with hospital admission in past one year","Post Cardiac Transplant/Left Ventricular Assist Device (LVAD)","Significant Left ventricular systolic dysfunction (LVEF \\\\u003c40%)","Moderate or Severe Valvular Heart Disease","Congenital heart disease with severe PAH or Idiopathic PAH","Coronary Artery Disease with past CABG/PTCA/MI AND Hypertension/Diabetes on treatment","Angina AND Hypertension/Diabetes on treatment","CT/MRI documented stroke AND Hypertension/Diabetes on treatment","Pulmonary artery hypertension AND Hypertension/Diabetes on treatment","Diabetes (\\\\u003e 10 years OR with complications) AND Hypertension on treatment","Kidney/ Liver/ Hematopoietic stem cell transplant: Recipient/On wait-list","End Stage Kidney Disease on haemodialysis/ CAPD","Current prolonged use of oral corticosteroids/ immunosuppressant medications","Decompensated cirrhosis","Severe respiratory disease with hospitalizations in last two years/FEV1 \\\\u003c50%","Lymphoma/ Leukaemia/ Myeloma","Diagnosis of any solid cancer on or after 1st July 2020 OR currently on any cancer therapy","Sickle Cell Disease/ Bone marrow failure/ Aplastic Anaemia/ Thalassemia Major","Primary Immunodeficiency Diseases/ HIV infection","Persons with disabilities due to Intellectual disabilities/ Muscular Dystrophy/ Acid attack with involvement of respiratory system/ Persons with disabilities having high support needs/ Multiple disabilities including deaf-blindness"],"maxAge":120,"minAge":50}}],"Tags":[],"SnapshotID":13,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
15	2021-10-12 11:02:24.615287+00	2021-10-12 11:02:24.615287+00	\N	3		{"ID":3,"CreatedAt":"2021-10-12T11:02:24.605612Z","UpdatedAt":"2021-10-12T11:02:24.605612Z","DeletedAt":null,"Key":"kvoz6fm15iryyn191","Description":"notification_templates","CreatedBy":"","UpdatedBy":"","Enabled":false,"Segments":[],"Variants":[],"Tags":[],"SnapshotID":0,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
17	2021-10-12 11:02:30.55541+00	2021-10-12 11:02:30.55541+00	\N	3		{"ID":3,"CreatedAt":"2021-10-12T11:02:24.605612Z","UpdatedAt":"2021-10-12T11:02:30.547361Z","DeletedAt":null,"Key":"notification_templates","Description":"notification_templates","CreatedBy":"","UpdatedBy":"","Enabled":true,"Segments":[],"Variants":[],"Tags":[],"SnapshotID":16,"Notes":"","DataRecordsEnabled":false,"EntityType":""}
\.


--
-- Data for Name: flags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flags (id, created_at, updated_at, deleted_at, key, description, created_by, updated_by, enabled, snapshot_id, notes, data_records_enabled, entity_type) FROM stdin;
1	2021-10-12 10:55:21.276696+00	2021-10-12 11:00:53.91912+00	\N	country_specific_features	country_specific_features			t	7		f	
2	2021-10-12 11:01:27.333264+00	2021-10-12 11:02:10.874687+00	\N	programs	programs			t	14		f	
3	2021-10-12 11:02:24.605612+00	2021-10-12 11:02:30.556288+00	\N	notification_templates	notification_templates			t	17		f	
\.


--
-- Data for Name: flags_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flags_tags (flag_id, tag_id) FROM stdin;
\.


--
-- Data for Name: segments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.segments (id, created_at, updated_at, deleted_at, flag_id, description, rank, rollout_percent) FROM stdin;
1	2021-10-12 11:00:47.098956+00	2021-10-12 11:00:53.920111+00	\N	1	default	999	100
2	2021-10-12 11:02:03.841636+00	2021-10-12 11:02:10.875832+00	\N	2	acbf8b77-5bac-4284-97c2-3bff8d94fe2f	999	100
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, created_at, updated_at, deleted_at, value) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, updated_at, deleted_at, email) FROM stdin;
\.


--
-- Data for Name: variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variants (id, created_at, updated_at, deleted_at, flag_id, key, attachment) FROM stdin;
1	2021-10-12 10:55:36.428592+00	2021-10-12 11:00:53.921997+00	\N	1	India	{"applicationLogo":"","countryCode":"+91","countryName":"India","currency":"INR","nationalities":["India","Others"],"stateAndDistricts":{"states":[{"capital":"Mayabunder","code":"AN","coordinates":["92.6586","11.7401"],"districts":[{"id":"1","name":"Nicobar"},{"id":"2","name":"North and Middle Andaman"},{"id":"3","name":"South Andaman"}],"id":"1","name":"Andaman and Nicobar Islands","type":"Union Territory"},{"capital":"Amaravati","code":"AP","coordinates":["79.7400","15.9129"],"districts":[{"id":"1","name":"Anantapur"},{"id":"2","name":"Chittoor"},{"id":"3","name":"East Godavari"},{"id":"4","name":"Guntur"},{"id":"5","name":"Krishna"},{"id":"6","name":"Kurnool"},{"id":"7","name":"Nellore"},{"id":"8","name":"Prakasam"},{"id":"9","name":"Srikakulam"},{"id":"10","name":"Visakhapatnam"},{"id":"11","name":"Vizianagaram"},{"id":"12","name":"West Godavari"},{"id":"13","name":"YSR Kadapa"}],"id":"2","name":"Andhra Pradesh","type":"State"},{"capital":"Itanagar","code":"AR","coordinates":["94.7278","28.2180"],"districts":[{"id":"1","name":"Tawang"},{"id":"2","name":"West Kameng"},{"id":"3","name":"East Kameng"},{"id":"4","name":"Papum Pare"},{"id":"5","name":"Kurung Kumey"},{"id":"6","name":"Kra Daadi"},{"id":"7","name":"Lower Subansiri"},{"id":"8","name":"Upper Subansiri"},{"id":"9","name":"West Siang"},{"id":"10","name":"East Siang"},{"id":"11","name":"Siang"},{"id":"12","name":"Upper Siang"},{"id":"13","name":"Lower Siang"},{"id":"14","name":"Lower Dibang Valley"},{"id":"15","name":"Dibang Valley"},{"id":"16","name":"Anjaw"},{"id":"17","name":"Lohit"},{"id":"18","name":"Namsai"},{"id":"19","name":"Changlang"},{"id":"20","name":"Tirap"},{"id":"21","name":"Longding"}],"id":"3","name":"Arunachal Pradesh","type":"State"},{"capital":"Dispur","code":"AS","coordinates":["92.9376","26.2006"],"districts":[{"id":"1","name":"Baksa"},{"id":"2","name":"Barpeta"},{"id":"3","name":"Biswanath"},{"id":"4","name":"Bongaigaon"},{"id":"5","name":"Cachar"},{"id":"6","name":"Charaideo"},{"id":"7","name":"Chirang"},{"id":"8","name":"Darrang"},{"id":"9","name":"Dhemaji"},{"id":"10","name":"Dhubri"},{"id":"11","name":"Dibrugarh"},{"id":"12","name":"Goalpara"},{"id":"13","name":"Golaghat"},{"id":"14","name":"Hailakandi"},{"id":"15","name":"Hojai"},{"id":"16","name":"Jorhat"},{"id":"17","name":"Kamrup Metropolitan"},{"id":"18","name":"Kamrup"},{"id":"19","name":"Karbi Anglong"},{"id":"20","name":"Karimganj"},{"id":"21","name":"Kokrajhar"},{"id":"22","name":"Lakhimpur"},{"id":"23","name":"Majuli"},{"id":"24","name":"Morigaon"},{"id":"25","name":"Nagaon"},{"id":"26","name":"Nalbari"},{"id":"27","name":"Dima Hasao"},{"id":"28","name":"Sivasagar"},{"id":"29","name":"Sonitpur"},{"id":"30","name":"South Salmara-Mankachar"},{"id":"31","name":"Tinsukia"},{"id":"32","name":"Udalguri"},{"id":"33","name":"West Karbi Anglong"}],"id":"4","name":"Assam","type":"State"},{"capital":"Patna","code":"BR","coordinates":["85.3131","25.0961"],"districts":[{"id":"1","name":"Araria"},{"id":"2","name":"Arwal"},{"id":"3","name":"Aurangabad"},{"id":"4","name":"Banka"},{"id":"5","name":"Begusarai"},{"id":"6","name":"Bhagalpur"},{"id":"7","name":"Bhojpur"},{"id":"8","name":"Buxar"},{"id":"9","name":"Darbhanga"},{"id":"10","name":"East Champaran (Motihari)"},{"id":"11","name":"Gaya"},{"id":"12","name":"Gopalganj"},{"id":"13","name":"Jamui"},{"id":"14","name":"Jehanabad"},{"id":"15","name":"Kaimur (Bhabua)"},{"id":"16","name":"Katihar"},{"id":"17","name":"Khagaria"},{"id":"18","name":"Kishanganj"},{"id":"19","name":"Lakhisarai"},{"id":"20","name":"Madhepura"},{"id":"21","name":"Madhubani"},{"id":"22","name":"Munger (Monghyr)"},{"id":"23","name":"Muzaffarpur"},{"id":"24","name":"Nalanda"},{"id":"25","name":"Nawada"},{"id":"26","name":"Patna"},{"id":"27","name":"Purnia (Purnea)"},{"id":"28","name":"Rohtas"},{"id":"29","name":"Saharsa"},{"id":"30","name":"Samastipur"},{"id":"31","name":"Saran"},{"id":"32","name":"Sheikhpura"},{"id":"33","name":"Sheohar"},{"id":"34","name":"Sitamarhi"},{"id":"35","name":"Siwan"},{"id":"36","name":"Supaul"},{"id":"37","name":"Vaishali"},{"id":"38","name":"West Champaran"}],"id":"5","name":"Bihar","type":"State"},{"capital":"Chandigarh","code":"CG","coordinates":["76.7794","30.7333"],"districts":[{"id":"1","name":"Chandigarh"}],"id":"6","name":"Chandigarh","type":"Union Territory"},{"capital":"Bilaspur (Judiciary), Raipur","code":"CH","coordinates":["81.8661","21.2787"],"districts":[{"id":"1","name":"Balod"},{"id":"2","name":"Baloda Bazar"},{"id":"3","name":"Balrampur"},{"id":"4","name":"Bastar"},{"id":"5","name":"Bemetara"},{"id":"6","name":"Bijapur"},{"id":"7","name":"Bilaspur"},{"id":"8","name":"Dantewada (South Bastar)"},{"id":"9","name":"Dhamtari"},{"id":"10","name":"Durg"},{"id":"11","name":"Gariyaband"},{"id":"12","name":"Janjgir-Champa"},{"id":"13","name":"Jashpur"},{"id":"14","name":"Kabirdham (Kawardha)"},{"id":"15","name":"Kanker (North Bastar)"},{"id":"16","name":"Kondagaon"},{"id":"17","name":"Korba"},{"id":"18","name":"Korea (Koriya)"},{"id":"19","name":"Mahasamund"},{"id":"20","name":"Mungeli"},{"id":"21","name":"Narayanpur"},{"id":"22","name":"Raigarh"},{"id":"23","name":"Raipur"},{"id":"24","name":"Rajnandgaon"},{"id":"25","name":"Sukma"},{"id":"26","name":"Surajpur  "},{"id":"27","name":"Surguja"}],"id":"7","name":"Chhattisgarh","type":"State"},{"capital":"Silvassa","code":"DH","coordinates":["73.0169","20.1809"],"districts":[{"id":"1","name":"Dadra \\\\u0026 Nagar Haveli"}],"id":"8","name":"Dadra and Nagar Haveli","type":"Union Territory"},{"capital":"Daman","code":"DD","coordinates":["72.8397","20.4283"],"districts":[{"id":"1","name":"Daman"},{"id":"2","name":"Diu"}],"id":"9","name":"Daman and Diu","type":"Union Territory"},{"capital":"New Delhi","code":"DL","coordinates":["77.1025","28.7041"],"districts":[{"id":"1","name":"Central Delhi"},{"id":"2","name":"East Delhi"},{"id":"3","name":"New Delhi"},{"id":"4","name":"North Delhi"},{"id":"5","name":"North East  Delhi"},{"id":"6","name":"North West  Delhi"},{"id":"7","name":"Shahdara"},{"id":"8","name":"South Delhi"},{"id":"9","name":"South East Delhi"},{"id":"10","name":"South West  Delhi"},{"id":"11","name":"West Delhi"}],"id":"10","name":"Delhi","type":"National Capital Territory"},{"capital":"Panaji","code":"GA","coordinates":["74.1240","15.2993"],"districts":[{"id":"1","name":"North Goa"},{"id":"2","name":"South Goa"}],"id":"11","name":"Goa","type":"State"},{"capital":"Gandhinagar","code":"GJ","coordinates":["71.1924","22.2587"],"districts":[{"id":"1","name":"Ahmedabad"},{"id":"2","name":"Amreli"},{"id":"3","name":"Anand"},{"id":"4","name":"Aravalli"},{"id":"5","name":"Banaskantha (Palanpur)"},{"id":"6","name":"Bharuch"},{"id":"7","name":"Bhavnagar"},{"id":"8","name":"Botad"},{"id":"9","name":"Chhota Udepur"},{"id":"10","name":"Dahod"},{"id":"11","name":"Dangs (Ahwa)"},{"id":"12","name":"Devbhoomi Dwarka"},{"id":"13","name":"Gandhinagar"},{"id":"14","name":"Gir Somnath"},{"id":"15","name":"Jamnagar"},{"id":"16","name":"Junagadh"},{"id":"17","name":"Kachchh"},{"id":"18","name":"Kheda (Nadiad)"},{"id":"19","name":"Mahisagar"},{"id":"20","name":"Mehsana"},{"id":"21","name":"Morbi"},{"id":"22","name":"Narmada (Rajpipla)"},{"id":"23","name":"Navsari"},{"id":"24","name":"Panchmahal (Godhra)"},{"id":"25","name":"Patan"},{"id":"26","name":"Porbandar"},{"id":"27","name":"Rajkot"},{"id":"28","name":"Sabarkantha (Himmatnagar)"},{"id":"29","name":"Surat"},{"id":"30","name":"Surendranagar"},{"id":"31","name":"Tapi (Vyara)"},{"id":"32","name":"Vadodara"},{"id":"33","name":"Valsad"}],"id":"12","name":"Gujarat","type":"State"},{"capital":"Chandigarh","code":"HR","coordinates":["76.0856","29.0588"],"districts":[{"id":"1","name":"Ambala"},{"id":"2","name":"Bhiwani"},{"id":"3","name":"Charkhi Dadri"},{"id":"4","name":"Faridabad"},{"id":"5","name":"Fatehabad"},{"id":"6","name":"Gurgaon"},{"id":"7","name":"Hisar"},{"id":"8","name":"Jhajjar"},{"id":"9","name":"Jind"},{"id":"10","name":"Kaithal"},{"id":"11","name":"Karnal"},{"id":"12","name":"Kurukshetra"},{"id":"13","name":"Mahendragarh"},{"id":"14","name":"Mewat"},{"id":"15","name":"Palwal"},{"id":"16","name":"Panchkula"},{"id":"17","name":"Panipat"},{"id":"18","name":"Rewari"},{"id":"19","name":"Rohtak"},{"id":"20","name":"Sirsa"},{"id":"21","name":"Sonipat"},{"id":"22","name":"Yamunanagar"}],"id":"13","name":"Haryana","type":"State"},{"capital":"Shimla","code":"HP","coordinates":["77.1734","31.1048"],"districts":[{"id":"1","name":"Bilaspur"},{"id":"2","name":"Chamba"},{"id":"3","name":"Hamirpur"},{"id":"4","name":"Kangra"},{"id":"5","name":"Kinnaur"},{"id":"6","name":"Kullu"},{"id":"7","name":"Lahaul \\\\u0026amp; Spiti"},{"id":"8","name":"Mandi"},{"id":"9","name":"Shimla"},{"id":"10","name":"Sirmaur (Sirmour)"},{"id":"11","name":"Solan"},{"id":"12","name":"Una"}],"id":"14","name":"Himachal Pradesh","type":"State"},{"capital":"Jammu (Winter), Srinagar (Summer)","code":"JK","coordinates":["76.5762","33.7782"],"districts":[{"id":"1","name":"Anantnag"},{"id":"2","name":"Bandipore"},{"id":"3","name":"Baramulla"},{"id":"4","name":"Budgam"},{"id":"5","name":"Doda"},{"id":"6","name":"Ganderbal"},{"id":"7","name":"Jammu"},{"id":"8","name":"Kargil"},{"id":"9","name":"Kathua"},{"id":"10","name":"Kishtwar"},{"id":"11","name":"Kulgam"},{"id":"12","name":"Kupwara"},{"id":"13","name":"Leh"},{"id":"14","name":"Poonch"},{"id":"15","name":"Pulwama"},{"id":"16","name":"Rajouri"},{"id":"17","name":"Ramban"},{"id":"18","name":"Reasi"},{"id":"19","name":"Samba"},{"id":"20","name":"Shopian"},{"id":"21","name":"Srinagar"},{"id":"22","name":"Udhampur"}],"id":"15","name":"Jammu and Kashmir","type":"Union Territory"},{"capital":"Ranchi","code":"JH","coordinates":["85.2799","23.6102"],"districts":[{"id":"1","name":"Bokaro"},{"id":"2","name":"Chatra"},{"id":"3","name":"Deoghar"},{"id":"4","name":"Dhanbad"},{"id":"5","name":"Dumka"},{"id":"6","name":"East Singhbhum"},{"id":"7","name":"Garhwa"},{"id":"8","name":"Giridih"},{"id":"9","name":"Godda"},{"id":"10","name":"Gumla"},{"id":"11","name":"Hazaribag"},{"id":"12","name":"Jamtara"},{"id":"13","name":"Khunti"},{"id":"14","name":"Koderma"},{"id":"15","name":"Latehar"},{"id":"16","name":"Lohardaga"},{"id":"17","name":"Pakur"},{"id":"18","name":"Palamu"},{"id":"19","name":"Ramgarh"},{"id":"20","name":"Ranchi"},{"id":"21","name":"Sahibganj"},{"id":"22","name":"Seraikela-Kharsawan"},{"id":"23","name":"Simdega"},{"id":"24","name":"West Singhbhum"}],"id":"16","name":"Jharkhand","type":"State"},{"capital":"Bengaluru","code":"KA","coordinates":["75.7139","15.3173"],"districts":[{"id":"1","name":"Bagalkot"},{"id":"2","name":"Ballari (Bellary)"},{"id":"3","name":"Belagavi (Belgaum)"},{"id":"4","name":"Bengaluru (Bangalore) Rural"},{"id":"5","name":"Bengaluru (Bangalore) Urban"},{"id":"6","name":"Bidar"},{"id":"7","name":"Chamarajanagar"},{"id":"8","name":"Chikballapur"},{"id":"9","name":"Chikkamagaluru (Chikmagalur)"},{"id":"10","name":"Chitradurga"},{"id":"11","name":"Dakshina Kannada"},{"id":"12","name":"Davangere"},{"id":"13","name":"Dharwad"},{"id":"14","name":"Gadag"},{"id":"15","name":"Hassan"},{"id":"16","name":"Haveri"},{"id":"17","name":"Kalaburagi (Gulbarga)"},{"id":"18","name":"Kodagu"},{"id":"19","name":"Kolar"},{"id":"20","name":"Koppal"},{"id":"21","name":"Mandya"},{"id":"22","name":"Mysuru (Mysore)"},{"id":"23","name":"Raichur"},{"id":"24","name":"Ramanagara"},{"id":"25","name":"Shivamogga (Shimoga)"},{"id":"26","name":"Tumakuru (Tumkur)"},{"id":"27","name":"Udupi"},{"id":"28","name":"Uttara Kannada (Karwar)"},{"id":"29","name":"Vijayapura (Bijapur)"},{"id":"30","name":"Yadgir"}],"id":"17","name":"Karnataka","type":"State"},{"capital":"Thiruvananthapuram","code":"KL","coordinates":["76.2711","10.8505"],"districts":[{"id":"1","name":"Alappuzha"},{"id":"2","name":"Ernakulam"},{"id":"3","name":"Idukki"},{"id":"4","name":"Kannur"},{"id":"5","name":"Kasaragod"},{"id":"6","name":"Kollam"},{"id":"7","name":"Kottayam"},{"id":"8","name":"Kozhikode"},{"id":"9","name":"Malappuram"},{"id":"10","name":"Palakkad"},{"id":"11","name":"Pathanamthitta"},{"id":"12","name":"Thiruvananthapuram"},{"id":"13","name":"Thrissur"},{"id":"14","name":"Wayanad"}],"id":"18","name":"Kerala","type":"State"},{"capital":"Leh, Kargil","code":"LA","coordinates":["77.6151","34.2095"],"districts":[{"id":"1","name":"Kargil"},{"id":"2","name":"Leh"}],"id":"19","name":"Ladakh","type":"Union Territory"},{"capital":"Kavaratti","code":"LD","coordinates":["72.1833","13.7000"],"districts":[{"id":"1","name":"Agatti"},{"id":"2","name":"Amini"},{"id":"3","name":"Androth"},{"id":"4","name":"Bithra"},{"id":"5","name":"Chethlath"},{"id":"6","name":"Kavaratti"},{"id":"7","name":"Kadmath"},{"id":"8","name":"Kalpeni"},{"id":"9","name":"Kilthan"},{"id":"10","name":"Minicoy"}],"id":"20","name":"Lakshadweep","type":"Union Territory"},{"capital":"Bhopal","code":"MP","coordinates":["78.6569","22.9734"],"districts":[{"id":"1","name":"Agar Malwa"},{"id":"2","name":"Alirajpur"},{"id":"3","name":"Anuppur"},{"id":"4","name":"Ashoknagar"},{"id":"5","name":"Balaghat"},{"id":"6","name":"Barwani"},{"id":"7","name":"Betul"},{"id":"8","name":"Bhind"},{"id":"9","name":"Bhopal"},{"id":"10","name":"Burhanpur"},{"id":"11","name":"Chhatarpur"},{"id":"12","name":"Chhindwara"},{"id":"13","name":"Damoh"},{"id":"14","name":"Datia"},{"id":"15","name":"Dewas"},{"id":"16","name":"Dhar"},{"id":"17","name":"Dindori"},{"id":"18","name":"Guna"},{"id":"19","name":"Gwalior"},{"id":"20","name":"Harda"},{"id":"21","name":"Hoshangabad"},{"id":"22","name":"Indore"},{"id":"23","name":"Jabalpur"},{"id":"24","name":"Jhabua"},{"id":"25","name":"Katni"},{"id":"26","name":"Khandwa"},{"id":"27","name":"Khargone"},{"id":"28","name":"Mandla"},{"id":"29","name":"Mandsaur"},{"id":"30","name":"Morena"},{"id":"31","name":"Narsinghpur"},{"id":"32","name":"Neemuch"},{"id":"33","name":"Panna"},{"id":"34","name":"Raisen"},{"id":"35","name":"Rajgarh"},{"id":"36","name":"Ratlam"},{"id":"37","name":"Rewa"},{"id":"38","name":"Sagar"},{"id":"39","name":"Satna"},{"id":"40","name":"Sehore"},{"id":"41","name":"Seoni"},{"id":"42","name":"Shahdol"},{"id":"43","name":"Shajapur"},{"id":"44","name":"Sheopur"},{"id":"45","name":"Shivpuri"},{"id":"46","name":"Sidhi"},{"id":"47","name":"Singrauli"},{"id":"48","name":"Tikamgarh"},{"id":"49","name":"Ujjain"},{"id":"50","name":"Umaria"},{"id":"51","name":"Vidisha"}],"id":"21","name":"Madhya Pradesh","type":"State"},{"capital":"Mumbai","code":"MH","coordinates":["75.7139","19.7515"],"districts":[{"id":"1","name":"Ahmednagar"},{"id":"2","name":"Akola"},{"id":"3","name":"Amravati"},{"id":"4","name":"Aurangabad"},{"id":"5","name":"Beed"},{"id":"6","name":"Bhandara"},{"id":"7","name":"Buldhana"},{"id":"8","name":"Chandrapur"},{"id":"9","name":"Dhule"},{"id":"10","name":"Gadchiroli"},{"id":"11","name":"Gondia"},{"id":"12","name":"Hingoli"},{"id":"13","name":"Jalgaon"},{"id":"14","name":"Jalna"},{"id":"15","name":"Kolhapur"},{"id":"16","name":"Latur"},{"id":"17","name":"Mumbai City"},{"id":"18","name":"Mumbai Suburban"},{"id":"19","name":"Nagpur"},{"id":"20","name":"Nanded"},{"id":"21","name":"Nandurbar"},{"id":"22","name":"Nashik"},{"id":"23","name":"Osmanabad"},{"id":"24","name":"Palghar"},{"id":"25","name":"Parbhani"},{"id":"26","name":"Pune"},{"id":"27","name":"Raigad"},{"id":"28","name":"Ratnagiri"},{"id":"29","name":"Sangli"},{"id":"30","name":"Satara"},{"id":"31","name":"Sindhudurg"},{"id":"32","name":"Solapur"},{"id":"33","name":"Thane"},{"id":"34","name":"Wardha"},{"id":"35","name":"Washim"},{"id":"36","name":"Yavatmal"}],"id":"22","name":"Maharashtra","type":"State"},{"capital":"Imphal","code":"MN","coordinates":["93.9063","24.6637"],"districts":[{"id":"1","name":"Bishnupur"},{"id":"2","name":"Chandel"},{"id":"3","name":"Churachandpur"},{"id":"4","name":"Imphal East"},{"id":"5","name":"Imphal West"},{"id":"6","name":"Jiribam"},{"id":"7","name":"Kakching"},{"id":"8","name":"Kamjong"},{"id":"9","name":"Kangpokpi"},{"id":"10","name":"Noney"},{"id":"11","name":"Pherzawl"},{"id":"12","name":"Senapati"},{"id":"13","name":"Tamenglong"},{"id":"14","name":"Tengnoupal"},{"id":"15","name":"Thoubal"},{"id":"16","name":"Ukhrul"}],"id":"23","name":"Manipur","type":"State"},{"capital":"Shillong","code":"ML","coordinates":["91.3662","25.4670"],"districts":[{"id":"1","name":"East Garo Hills"},{"id":"2","name":"East Jaintia Hills"},{"id":"3","name":"East Khasi Hills"},{"id":"4","name":"North Garo Hills"},{"id":"5","name":"Ri Bhoi"},{"id":"6","name":"South Garo Hills"},{"id":"7","name":"South West Garo Hills "},{"id":"8","name":"South West Khasi Hills"},{"id":"9","name":"West Garo Hills"},{"id":"10","name":"West Jaintia Hills"},{"id":"11","name":"West Khasi Hills"}],"id":"24","name":"Meghalaya","type":"State"},{"capital":"Aizawl","code":"MZ","coordinates":["92.9376","23.1645"],"districts":[{"id":"1","name":"Aizawl"},{"id":"2","name":"Champhai"},{"id":"3","name":"Kolasib"},{"id":"4","name":"Lawngtlai"},{"id":"5","name":"Lunglei"},{"id":"6","name":"Mamit"},{"id":"7","name":"Saiha"},{"id":"8","name":"Serchhip"}],"id":"25","name":"Mizoram","type":"State"},{"capital":"Kohima","code":"NL","coordinates":["94.5624","26.1584"],"districts":[{"id":"1","name":"Dimapur"},{"id":"2","name":"Kiphire"},{"id":"3","name":"Kohima"},{"id":"4","name":"Longleng"},{"id":"5","name":"Mokokchung"},{"id":"6","name":"Mon"},{"id":"7","name":"Peren"},{"id":"8","name":"Phek"},{"id":"9","name":"Tuensang"},{"id":"10","name":"Wokha"},{"id":"11","name":"Zunheboto"}],"id":"26","name":"Nagaland","type":"State"},{"capital":"Bhubaneswar","code":"OR","coordinates":["85.0985","20.9517"],"districts":[{"id":"1","name":"Angul"},{"id":"2","name":"Balangir"},{"id":"3","name":"Balasore"},{"id":"4","name":"Bargarh"},{"id":"5","name":"Bhadrak"},{"id":"6","name":"Boudh"},{"id":"7","name":"Cuttack"},{"id":"8","name":"Deogarh"},{"id":"9","name":"Dhenkanal"},{"id":"10","name":"Gajapati"},{"id":"11","name":"Ganjam"},{"id":"12","name":"Jagatsinghapur"},{"id":"13","name":"Jajpur"},{"id":"14","name":"Jharsuguda"},{"id":"15","name":"Kalahandi"},{"id":"16","name":"Kandhamal"},{"id":"17","name":"Kendrapara"},{"id":"18","name":"Kendujhar (Keonjhar)"},{"id":"19","name":"Khordha"},{"id":"20","name":"Koraput"},{"id":"21","name":"Malkangiri"},{"id":"22","name":"Mayurbhanj"},{"id":"23","name":"Nabarangpur"},{"id":"24","name":"Nayagarh"},{"id":"25","name":"Nuapada"},{"id":"26","name":"Puri"},{"id":"27","name":"Rayagada"},{"id":"28","name":"Sambalpur"},{"id":"29","name":"Sonepur"},{"id":"30","name":"Sundargarh"}],"id":"27","name":"Odisha","type":"State"},{"capital":"Puducherry","code":"PY","coordinates":["79.8083","11.9416"],"districts":[{"id":"1","name":"Karaikal"},{"id":"2","name":"Mahe"},{"id":"3","name":"Pondicherry"},{"id":"4","name":"Yanam"}],"id":"28","name":"Puducherry","type":"Union Territory"},{"capital":"Chandigarh","code":"PB","coordinates":["75.3412","31.1471"],"districts":[{"id":"1","name":"Amritsar"},{"id":"2","name":"Barnala"},{"id":"3","name":"Bathinda"},{"id":"4","name":"Faridkot"},{"id":"5","name":"Fatehgarh Sahib"},{"id":"6","name":"Fazilka"},{"id":"7","name":"Ferozepur"},{"id":"8","name":"Gurdaspur"},{"id":"9","name":"Hoshiarpur"},{"id":"10","name":"Jalandhar"},{"id":"11","name":"Kapurthala"},{"id":"12","name":"Ludhiana"},{"id":"13","name":"Mansa"},{"id":"14","name":"Moga"},{"id":"15","name":"Muktsar"},{"id":"16","name":"Nawanshahr (Shahid Bhagat Singh Nagar)"},{"id":"17","name":"Pathankot"},{"id":"18","name":"Patiala"},{"id":"19","name":"Rupnagar"},{"id":"20","name":"Sahibzada Ajit Singh Nagar (Mohali)"},{"id":"21","name":"Sangrur"},{"id":"22","name":"Tarn Taran"}],"id":"29","name":"Punjab","type":"State"},{"capital":"Jaipur","code":"RJ","coordinates":["74.2179","27.0238"],"districts":[{"id":"1","name":"Ajmer"},{"id":"2","name":"Alwar"},{"id":"3","name":"Banswara"},{"id":"4","name":"Baran"},{"id":"5","name":"Barmer"},{"id":"6","name":"Bharatpur"},{"id":"7","name":"Bhilwara"},{"id":"8","name":"Bikaner"},{"id":"9","name":"Bundi"},{"id":"10","name":"Chittorgarh"},{"id":"11","name":"Churu"},{"id":"12","name":"Dausa"},{"id":"13","name":"Dholpur"},{"id":"14","name":"Dungarpur"},{"id":"15","name":"Hanumangarh"},{"id":"16","name":"Jaipur"},{"id":"17","name":"Jaisalmer"},{"id":"18","name":"Jalore"},{"id":"19","name":"Jhalawar"},{"id":"20","name":"Jhunjhunu"},{"id":"21","name":"Jodhpur"},{"id":"22","name":"Karauli"},{"id":"23","name":"Kota"},{"id":"24","name":"Nagaur"},{"id":"25","name":"Pali"},{"id":"26","name":"Pratapgarh"},{"id":"27","name":"Rajsamand"},{"id":"28","name":"Sawai Madhopur"},{"id":"29","name":"Sikar"},{"id":"30","name":"Sirohi"},{"id":"31","name":"Sri Ganganagar"},{"id":"32","name":"Tonk"},{"id":"33","name":"Udaipur"}],"id":"30","name":"Rajasthan","type":"State"},{"capital":"Gangtok","code":"SK","coordinates":["88.5122","27.5330"],"districts":[{"id":"1","name":"East Sikkim"},{"id":"2","name":"North Sikkim"},{"id":"3","name":"South Sikkim"},{"id":"4","name":"West Sikkim"}],"id":"31","name":"Sikkim","type":"State"},{"capital":"Chennai","code":"TN","coordinates":["78.6569","11.1271"],"districts":[{"id":"1","name":"Ariyalur"},{"id":"2","name":"Chennai"},{"id":"3","name":"Coimbatore"},{"id":"4","name":"Cuddalore"},{"id":"5","name":"Dharmapuri"},{"id":"6","name":"Dindigul"},{"id":"7","name":"Erode"},{"id":"8","name":"Kanchipuram"},{"id":"9","name":"Kanyakumari"},{"id":"10","name":"Karur"},{"id":"11","name":"Krishnagiri"},{"id":"12","name":"Madurai"},{"id":"13","name":"Nagapattinam"},{"id":"14","name":"Namakkal"},{"id":"15","name":"Nilgiris"},{"id":"16","name":"Perambalur"},{"id":"17","name":"Pudukkottai"},{"id":"18","name":"Ramanathapuram"},{"id":"19","name":"Salem"},{"id":"20","name":"Sivaganga"},{"id":"21","name":"Thanjavur"},{"id":"22","name":"Theni"},{"id":"23","name":"Thoothukudi (Tuticorin)"},{"id":"24","name":"Tiruchirappalli"},{"id":"25","name":"Tirunelveli"},{"id":"26","name":"Tiruppur"},{"id":"27","name":"Tiruvallur"},{"id":"28","name":"Tiruvannamalai"},{"id":"29","name":"Tiruvarur"},{"id":"30","name":"Vellore"},{"id":"31","name":"Viluppuram"},{"id":"32","name":"Virudhunagar"}],"id":"32","name":"Tamil Nadu","type":"State"},{"capital":"Hyderabad","code":"TS","coordinates":["79.0193","18.1124"],"districts":[{"id":"1","name":"Adilabad"},{"id":"2","name":"Bhadradri Kothagudem"},{"id":"3","name":"Hyderabad"},{"id":"4","name":"Jagtial"},{"id":"5","name":"Jangaon"},{"id":"6","name":"Jayashankar Bhoopalpally"},{"id":"7","name":"Jogulamba Gadwal"},{"id":"8","name":"Kamareddy"},{"id":"9","name":"Karimnagar"},{"id":"10","name":"Khammam"},{"id":"11","name":"Komaram Bheem Asifabad"},{"id":"12","name":"Mahabubabad"},{"id":"13","name":"Mahabubnagar"},{"id":"14","name":"Mancherial"},{"id":"15","name":"Medak"},{"id":"16","name":"Medchal"},{"id":"17","name":"Nagarkurnool"},{"id":"18","name":"Nalgonda"},{"id":"19","name":"Nirmal"},{"id":"20","name":"Nizamabad"},{"id":"21","name":"Peddapalli"},{"id":"22","name":"Rajanna Sircilla"},{"id":"23","name":"Rangareddy"},{"id":"24","name":"Sangareddy"},{"id":"25","name":"Siddipet"},{"id":"26","name":"Suryapet"},{"id":"27","name":"Vikarabad"},{"id":"28","name":"Wanaparthy"},{"id":"29","name":"Warangal (Rural)"},{"id":"30","name":"Warangal (Urban)"},{"id":"31","name":"Yadadri Bhuvanagiri"}],"id":"33","name":"Telangana","type":"State"},{"capital":"Agartala","code":"TR","coordinates":["91.9882","23.9408"],"districts":[{"id":"1","name":"Dhalai"},{"id":"2","name":"Gomati"},{"id":"3","name":"Khowai"},{"id":"4","name":"North Tripura"},{"id":"5","name":"Sepahijala"},{"id":"6","name":"South Tripura"},{"id":"7","name":"Unakoti"},{"id":"8","name":"West Tripura"}],"id":"34","name":"Tripura","type":"State"},{"capital":"Lucknow","code":"UP","coordinates":["80.9462","26.8467"],"districts":[{"id":"1","name":"Agra"},{"id":"2","name":"Aligarh"},{"id":"3","name":"Allahabad"},{"id":"4","name":"Ambedkar Nagar"},{"id":"5","name":"Amethi (Chatrapati Sahuji Mahraj Nagar)"},{"id":"6","name":"Amroha (J.P. Nagar)"},{"id":"7","name":"Auraiya"},{"id":"8","name":"Azamgarh"},{"id":"9","name":"Baghpat"},{"id":"10","name":"Bahraich"},{"id":"11","name":"Ballia"},{"id":"12","name":"Balrampur"},{"id":"13","name":"Banda"},{"id":"14","name":"Barabanki"},{"id":"15","name":"Bareilly"},{"id":"16","name":"Basti"},{"id":"17","name":"Bhadohi"},{"id":"18","name":"Bijnor"},{"id":"19","name":"Budaun"},{"id":"20","name":"Bulandshahr"},{"id":"21","name":"Chandauli"},{"id":"22","name":"Chitrakoot"},{"id":"23","name":"Deoria"},{"id":"24","name":"Etah"},{"id":"25","name":"Etawah"},{"id":"26","name":"Faizabad"},{"id":"27","name":"Farrukhabad"},{"id":"28","name":"Fatehpur"},{"id":"29","name":"Firozabad"},{"id":"30","name":"Gautam Buddha Nagar"},{"id":"31","name":"Ghaziabad"},{"id":"32","name":"Ghazipur"},{"id":"33","name":"Gonda"},{"id":"34","name":"Gorakhpur"},{"id":"35","name":"Hamirpur"},{"id":"36","name":"Hapur (Panchsheel Nagar)"},{"id":"37","name":"Hardoi"},{"id":"38","name":"Hathras"},{"id":"39","name":"Jalaun"},{"id":"40","name":"Jaunpur"},{"id":"41","name":"Jhansi"},{"id":"42","name":"Kannauj"},{"id":"43","name":"Kanpur Dehat"},{"id":"44","name":"Kanpur Nagar"},{"id":"45","name":"Kanshiram Nagar (Kasganj)"},{"id":"46","name":"Kaushambi"},{"id":"47","name":"Kushinagar (Padrauna)"},{"id":"48","name":"Lakhimpur - Kheri"},{"id":"49","name":"Lalitpur"},{"id":"50","name":"Lucknow"},{"id":"51","name":"Maharajganj"},{"id":"52","name":"Mahoba"},{"id":"53","name":"Mainpuri"},{"id":"54","name":"Mathura"},{"id":"55","name":"Mau"},{"id":"56","name":"Meerut"},{"id":"57","name":"Mirzapur"},{"id":"58","name":"Moradabad"},{"id":"59","name":"Muzaffarnagar"},{"id":"60","name":"Pilibhit"},{"id":"61","name":"Pratapgarh"},{"id":"62","name":"RaeBareli"},{"id":"63","name":"Rampur"},{"id":"64","name":"Saharanpur"},{"id":"65","name":"Sambhal (Bhim Nagar)"},{"id":"66","name":"Sant Kabir Nagar"},{"id":"67","name":"Shahjahanpur"},{"id":"68","name":"Shamali (Prabuddh Nagar)"},{"id":"69","name":"Shravasti"},{"id":"70","name":"Siddharth Nagar"},{"id":"71","name":"Sitapur"},{"id":"72","name":"Sonbhadra"},{"id":"73","name":"Sultanpur"},{"id":"74","name":"Unnao"},{"id":"75","name":"Varanasi"}],"id":"35","name":"Uttar Pradesh","type":"State"},{"capital":"Dehradun","code":"UK","coordinates":["78.0322","30.3165"],"districts":[{"id":"1","name":"Almora"},{"id":"2","name":"Bageshwar"},{"id":"3","name":"Chamoli"},{"id":"4","name":"Champawat"},{"id":"5","name":"Dehradun"},{"id":"6","name":"Haridwar"},{"id":"7","name":"Nainital"},{"id":"8","name":"Pauri Garhwal"},{"id":"9","name":"Pithoragarh"},{"id":"10","name":"Rudraprayag"},{"id":"11","name":"Tehri Garhwal"},{"id":"12","name":"Udham Singh Nagar"},{"id":"13","name":"Uttarkashi"}],"id":"36","name":"Uttarakhand","type":"State"},{"capital":"Kolkata","code":"WB","coordinates":["87.8550","22.9868"],"districts":[{"id":"1","name":"Alipurduar"},{"id":"2","name":"Bankura"},{"id":"3","name":"Birbhum"},{"id":"4","name":"Burdwan (Bardhaman)"},{"id":"5","name":"Cooch Behar"},{"id":"6","name":"Dakshin Dinajpur (South Dinajpur)"},{"id":"7","name":"Darjeeling"},{"id":"8","name":"Hooghly"},{"id":"9","name":"Howrah"},{"id":"10","name":"Jalpaiguri"},{"id":"11","name":"Kalimpong"},{"id":"12","name":"Kolkata"},{"id":"13","name":"Malda"},{"id":"14","name":"Murshidabad"},{"id":"15","name":"Nadia"},{"id":"16","name":"North 24 Parganas"},{"id":"17","name":"Paschim Medinipur (West Medinipur)"},{"id":"18","name":"Purba Medinipur (East Medinipur)"},{"id":"19","name":"Purulia"},{"id":"20","name":"South 24 Parganas"},{"id":"21","name":"Uttar Dinajpur (North Dinajpur)"}],"id":"37","name":"West Bengal","type":"State"}]}}
2	2021-10-12 11:01:47.925772+00	2021-10-12 11:02:10.877726+00	\N	2	acbf8b77-5bac-4284-97c2-3bff8d94fe2f	{"commorbidities":["Heart Failure with hospital admission in past one year","Post Cardiac Transplant/Left Ventricular Assist Device (LVAD)","Significant Left ventricular systolic dysfunction (LVEF \\\\u003c40%)","Moderate or Severe Valvular Heart Disease","Congenital heart disease with severe PAH or Idiopathic PAH","Coronary Artery Disease with past CABG/PTCA/MI AND Hypertension/Diabetes on treatment","Angina AND Hypertension/Diabetes on treatment","CT/MRI documented stroke AND Hypertension/Diabetes on treatment","Pulmonary artery hypertension AND Hypertension/Diabetes on treatment","Diabetes (\\\\u003e 10 years OR with complications) AND Hypertension on treatment","Kidney/ Liver/ Hematopoietic stem cell transplant: Recipient/On wait-list","End Stage Kidney Disease on haemodialysis/ CAPD","Current prolonged use of oral corticosteroids/ immunosuppressant medications","Decompensated cirrhosis","Severe respiratory disease with hospitalizations in last two years/FEV1 \\\\u003c50%","Lymphoma/ Leukaemia/ Myeloma","Diagnosis of any solid cancer on or after 1st July 2020 OR currently on any cancer therapy","Sickle Cell Disease/ Bone marrow failure/ Aplastic Anaemia/ Thalassemia Major","Primary Immunodeficiency Diseases/ HIV infection","Persons with disabilities due to Intellectual disabilities/ Muscular Dystrophy/ Acid attack with involvement of respiratory system/ Persons with disabilities having high support needs/ Multiple disabilities including deaf-blindness"],"maxAge":120,"minAge":50}
\.


--
-- Name: constraints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.constraints_id_seq', 1, false);


--
-- Name: distributions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.distributions_id_seq', 2, true);


--
-- Name: flag_entity_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flag_entity_types_id_seq', 1, true);


--
-- Name: flag_snapshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flag_snapshots_id_seq', 17, true);


--
-- Name: flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flags_id_seq', 3, true);


--
-- Name: segments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.segments_id_seq', 2, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.variants_id_seq', 2, true);


--
-- Name: constraints constraints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraints
    ADD CONSTRAINT constraints_pkey PRIMARY KEY (id);


--
-- Name: distributions distributions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distributions
    ADD CONSTRAINT distributions_pkey PRIMARY KEY (id);


--
-- Name: flag_entity_types flag_entity_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flag_entity_types
    ADD CONSTRAINT flag_entity_types_pkey PRIMARY KEY (id);


--
-- Name: flag_snapshots flag_snapshots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flag_snapshots
    ADD CONSTRAINT flag_snapshots_pkey PRIMARY KEY (id);


--
-- Name: flags flags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flags
    ADD CONSTRAINT flags_pkey PRIMARY KEY (id);


--
-- Name: flags_tags flags_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flags_tags
    ADD CONSTRAINT flags_tags_pkey PRIMARY KEY (flag_id, tag_id);


--
-- Name: segments segments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segments
    ADD CONSTRAINT segments_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: variants variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variants
    ADD CONSTRAINT variants_pkey PRIMARY KEY (id);


--
-- Name: flag_entity_type_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX flag_entity_type_key ON public.flag_entity_types USING btree (key);


--
-- Name: idx_constraint_segmentid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_constraint_segmentid ON public.constraints USING btree (segment_id);


--
-- Name: idx_constraints_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_constraints_deleted_at ON public.constraints USING btree (deleted_at);


--
-- Name: idx_distribution_segmentid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_distribution_segmentid ON public.distributions USING btree (segment_id);


--
-- Name: idx_distribution_variantid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_distribution_variantid ON public.distributions USING btree (variant_id);


--
-- Name: idx_distributions_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_distributions_deleted_at ON public.distributions USING btree (deleted_at);


--
-- Name: idx_flag_entity_types_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_flag_entity_types_deleted_at ON public.flag_entity_types USING btree (deleted_at);


--
-- Name: idx_flag_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_flag_key ON public.flags USING btree (key);


--
-- Name: idx_flag_snapshots_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_flag_snapshots_deleted_at ON public.flag_snapshots USING btree (deleted_at);


--
-- Name: idx_flags_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_flags_deleted_at ON public.flags USING btree (deleted_at);


--
-- Name: idx_flagsnapshot_flagid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_flagsnapshot_flagid ON public.flag_snapshots USING btree (flag_id);


--
-- Name: idx_segment_flagid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_segment_flagid ON public.segments USING btree (flag_id);


--
-- Name: idx_segments_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_segments_deleted_at ON public.segments USING btree (deleted_at);


--
-- Name: idx_tag_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_tag_value ON public.tags USING btree (value);


--
-- Name: idx_tags_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tags_deleted_at ON public.tags USING btree (deleted_at);


--
-- Name: idx_users_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_deleted_at ON public.users USING btree (deleted_at);


--
-- Name: idx_variant_flagid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_variant_flagid ON public.variants USING btree (flag_id);


--
-- Name: idx_variants_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_variants_deleted_at ON public.variants USING btree (deleted_at);


--
-- PostgreSQL database dump complete
--

