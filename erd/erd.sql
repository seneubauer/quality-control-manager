-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "inspection_records" (
    "record_id" composite   NOT NULL,
    "item_number" varchar(255)   NOT NULL,
    "drawing_number" varchar(255)   NOT NULL,
    "gage_id" int   NOT NULL,
    "date_measured" datetime   NOT NULL,
    "inspector_id" int   NOT NULL,
    "operator_id" int   NOT NULL,
    "disposition" boolean   NOT NULL,
    "purchase_order_id" int   NOT NULL,
    "reciever_number" varchar(255)   NOT NULL,
    "job_number" varchar(255)   NOT NULL,
    "full_inspect_interval" int   NOT NULL,
    "rel_quantity" int   NOT NULL,
    "comp_quantity" int   NOT NULL,
    "feature_id" int   NOT NULL,
    "dimension" varchar(255)   NOT NULL,
    "nominal" decimal   NOT NULL,
    "usl" decimal   NOT NULL,
    "lsl" decimal   NOT NULL,
    CONSTRAINT "pk_inspection_records" PRIMARY KEY (
        "record_id"
     )
);

CREATE TABLE "item_types" (
    "item_number" varchar(255)   NOT NULL,
    "description" varchar(255)   NOT NULL,
    CONSTRAINT "pk_item_types" PRIMARY KEY (
        "item_number"
     )
);

CREATE TABLE "drawing_types" (
    "drawing_id" composite   NOT NULL,
    "drawing_number" varchar(255)   NOT NULL,
    "revision" varchar(255)   NOT NULL,
    "description" varchar(255)   NOT NULL,
    CONSTRAINT "pk_drawing_types" PRIMARY KEY (
        "drawing_id"
     )
);

CREATE TABLE "gages" (
    "gage_id" serial   NOT NULL,
    "name" varchar(255)   NOT NULL,
    "last_calibrated" datetime   NOT NULL,
    "description" varchar(255)   NOT NULL,
    CONSTRAINT "pk_gages" PRIMARY KEY (
        "gage_id"
     )
);

CREATE TABLE "qc_personnel" (
    "employee_id" int   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_qc_personnel" PRIMARY KEY (
        "employee_id"
     )
);

CREATE TABLE "suppliers" (
    "supplier_id" serial   NOT NULL,
    "name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_suppliers" PRIMARY KEY (
        "supplier_id"
     )
);

CREATE TABLE "job_numbers" (
    "job_number" varchar(255)   NOT NULL,
    "description" varchar(255)   NOT NULL,
    CONSTRAINT "pk_job_numbers" PRIMARY KEY (
        "job_number"
     )
);

CREATE TABLE "purchase_orders" (
    "id" serial   NOT NULL,
    "supplier_id" int   NOT NULL,
    "description" varchar(255)   NOT NULL,
    CONSTRAINT "pk_purchase_orders" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "inspection_records" ADD CONSTRAINT "fk_inspection_records_item_number" FOREIGN KEY("item_number")
REFERENCES "item_types" ("item_number");

ALTER TABLE "inspection_records" ADD CONSTRAINT "fk_inspection_records_drawing_number" FOREIGN KEY("drawing_number")
REFERENCES "drawing_types" ("drawing_id");

ALTER TABLE "inspection_records" ADD CONSTRAINT "fk_inspection_records_gage_id" FOREIGN KEY("gage_id")
REFERENCES "gages" ("gage_id");

ALTER TABLE "inspection_records" ADD CONSTRAINT "fk_inspection_records_inspector_id" FOREIGN KEY("inspector_id")
REFERENCES "qc_personnel" ("employee_id");

ALTER TABLE "inspection_records" ADD CONSTRAINT "fk_inspection_records_operator_id" FOREIGN KEY("operator_id")
REFERENCES "qc_personnel" ("employee_id");

ALTER TABLE "inspection_records" ADD CONSTRAINT "fk_inspection_records_purchase_order_id" FOREIGN KEY("purchase_order_id")
REFERENCES "purchase_orders" ("id");

ALTER TABLE "inspection_records" ADD CONSTRAINT "fk_inspection_records_job_number" FOREIGN KEY("job_number")
REFERENCES "job_numbers" ("job_number");

ALTER TABLE "purchase_orders" ADD CONSTRAINT "fk_purchase_orders_supplier_id" FOREIGN KEY("supplier_id")
REFERENCES "suppliers" ("supplier_id");

