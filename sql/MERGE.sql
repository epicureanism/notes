use GISTesting;
CREATE NONCLUSTERED INDEX idx_DIARY_title
ON [account].[DIARY] ([TITLE_ID],[IS_DISABLED])
INCLUDE ([ID],[VOUCHER_ID],[AMOUNT],[CREATED_DATE],[PROJECT_NO],[PROJECT_CODE],[SHORT_MEMO1],[SHORT_MEMO2],[MEMO],[ENTRY_UID],[FORM_ID],[DATE_NOTE],[DEBIT_AMOUNT],[CREDIT_AMOUNT],[PAY_TO],[IS_REMITED],[REMIT_DATE],[IS_CHECKED],[CHECKE_DATE],[IS_REVERSED],[REVERSE_DATE],[VENDOR_ID],[RECEIVER_EMP_NO],[DOUBLE_ENTRY_SEQ],[REVERSE_SOURCE],[IS_DISPATCHED])
GO


CREATE TYPE account.DIARY_TYPE AS TABLE
(
    [ID] [uniqueidentifier] NOT NULL,
	[VOUCHER_ID] [varchar](50) NOT NULL,
	[TITLE_ID] [varchar](50) NOT NULL,
	[AMOUNT] [money] NOT NULL,
	[CREATED_DATE] [datetime2](7) NOT NULL,
	[ExpectedDate] [datetime2](7) NULL,
	[PROJECT_NO] [int] NULL,
	[PROJECT_CODE] [varchar](50) NULL,
	[SHORT_MEMO1] [nvarchar](4000) NULL,
	[SHORT_MEMO2] [nvarchar](4000) NULL,
	[MEMO] [nvarchar](4000) NULL,
	[ENTRY_UID] [uniqueidentifier] NOT NULL,
	[IS_DEBIT] [bit] NOT NULL,
	[IS_DISABLED] [bit] NOT NULL,
	[FORM_ID] [varchar](500) NULL,
	[FORM_TYPE] [varchar](50) NULL,
	[DATE_NOTE] [datetime2](7) NULL,
	[DEBIT_AMOUNT] [money] NULL,
	[CREDIT_AMOUNT] [money] NULL,
	[PAY_TO] [nvarchar](200) NULL,
	[IS_REMITED] [bit] NULL,
	[REMIT_DATE] [datetime2](7) NULL,
	[IS_CHECKED] [bit] NOT NULL,
	[CHECKE_DATE] [datetime2](7) NULL,
	[IS_REVERSED] [bit] NOT NULL,
	[REVERSE_DATE] [datetime2](7) NULL,
	[VENDOR_ID] [varchar](10) NULL,
	[RECEIVER_EMP_NO] [char](6) NULL,
	[DOUBLE_ENTRY_SEQ] [varchar](50) NULL,
	[SEQ_IN_VOUCHER] [int] NULL,
	[REVERSE_SOURCE] [uniqueidentifier] NULL,
	[IS_DISPATCHED] [bit] NULL,
	[IS_FIXED_COST] [bit] NOT NULL,
	[DEPRECIATION_SOURCE] [uniqueidentifier] NULL
);

ALTER  PROCEDURE [account].[USP_UPD_DIARY]
    @source account.DIARY_TYPE READONLY,
	@del_voucher_not_matched varchar(20) = null
AS
BEGIN
    MERGE INTO account.DIARY AS T --the target
    USING @source AS S --the source 
    ON T.ID = S.ID
    WHEN MATCHED THEN UPDATE 
		SET T.[VOUCHER_ID] = S.[VOUCHER_ID]
		  ,T.[TITLE_ID] = S.[TITLE_ID]
		  ,T.[AMOUNT] = S.[AMOUNT]
		  ,T.[CREATED_DATE] = S.[CREATED_DATE]
		  ,T.[ExpectedDate] = S.[ExpectedDate]
		  ,T.[PROJECT_NO] = S.[PROJECT_NO]
		  ,T.[PROJECT_CODE] = S.[PROJECT_CODE]
		  ,T.[SHORT_MEMO1] = S.[SHORT_MEMO1]
		  ,T.[SHORT_MEMO2] = S.[SHORT_MEMO2]
		  ,T.[MEMO] = S.[MEMO]
		  ,T.[ENTRY_UID] = S.[ENTRY_UID]
		  ,T.[IS_DEBIT] = S.[IS_DEBIT]
		  ,T.[IS_DISABLED] = S.[IS_DISABLED]
		  ,T.[FORM_ID] = S.[FORM_ID]
		  ,T.[FORM_TYPE] = S.[FORM_TYPE]
		  ,T.[DATE_NOTE] = S.[DATE_NOTE]
		  ,T.[DEBIT_AMOUNT] = S.[DEBIT_AMOUNT]
		  ,T.[CREDIT_AMOUNT] = S.[CREDIT_AMOUNT]
		  ,T.[PAY_TO] = S.[PAY_TO]
		  ,T.[IS_REMITED] = S.[IS_REMITED]
		  ,T.[REMIT_DATE] = S.[REMIT_DATE]
		  ,T.[IS_CHECKED] = S.[IS_CHECKED]
		  ,T.[CHECKE_DATE] = S.[CHECKE_DATE]
		  ,T.[IS_REVERSED] = S.[IS_REVERSED]
		  ,T.[REVERSE_DATE] = S.[REVERSE_DATE]
		  ,T.[VENDOR_ID] = S.[VENDOR_ID]
		  ,T.[RECEIVER_EMP_NO] = S.[RECEIVER_EMP_NO]
		  ,T.[DOUBLE_ENTRY_SEQ] = S.[DOUBLE_ENTRY_SEQ]
		  ,T.[SEQ_IN_VOUCHER] = S.[SEQ_IN_VOUCHER]
		  ,T.[REVERSE_SOURCE] = S.[REVERSE_SOURCE]
		  ,T.[IS_DISPATCHED] = S.[IS_DISPATCHED]
		  ,T.[IS_FIXED_COST] = S.[IS_FIXED_COST]
		  ,T.[DEPRECIATION_SOURCE] = S.[DEPRECIATION_SOURCE]
    WHEN NOT MATCHED BY TARGET THEN 
		INSERT (
			/** **/
			[ID]
           ,[VOUCHER_ID]
           ,[TITLE_ID]
           ,[AMOUNT]
           ,[CREATED_DATE]
           ,[ExpectedDate]
           ,[PROJECT_NO]
           ,[PROJECT_CODE]
           ,[SHORT_MEMO1]
           ,[SHORT_MEMO2]
           ,[MEMO]
           ,[ENTRY_UID]
           ,[IS_DEBIT]
           ,[IS_DISABLED]
           ,[FORM_ID]
           ,[FORM_TYPE]
           ,[DATE_NOTE]
           ,[DEBIT_AMOUNT]
           ,[CREDIT_AMOUNT]
           ,[PAY_TO]
           ,[IS_REMITED]
           ,[REMIT_DATE]
           ,[IS_CHECKED]
           ,[CHECKE_DATE]
           ,[IS_REVERSED]
           ,[REVERSE_DATE]
           ,[VENDOR_ID]
           ,[RECEIVER_EMP_NO]
           ,[DOUBLE_ENTRY_SEQ]
           ,[SEQ_IN_VOUCHER]
           ,[REVERSE_SOURCE]
           ,[IS_DISPATCHED]
           ,[IS_FIXED_COST]
           ,[DEPRECIATION_SOURCE])
		VALUES(S.[ID]
           ,S.[VOUCHER_ID]
           ,S.[TITLE_ID]
           ,S.[AMOUNT]
           ,S.[CREATED_DATE]
           ,S.[ExpectedDate]
           ,S.[PROJECT_NO]
           ,S.[PROJECT_CODE]
           ,S.[SHORT_MEMO1]
           ,S.[SHORT_MEMO2]
           ,S.[MEMO]
           ,S.[ENTRY_UID]
           ,S.[IS_DEBIT]
           ,S.[IS_DISABLED]
           ,S.[FORM_ID]
           ,S.[FORM_TYPE]
           ,S.[DATE_NOTE]
           ,S.[DEBIT_AMOUNT]
           ,S.[CREDIT_AMOUNT]
           ,S.[PAY_TO]
           ,S.[IS_REMITED]
           ,S.[REMIT_DATE]
           ,S.[IS_CHECKED]
           ,S.[CHECKE_DATE]
           ,S.[IS_REVERSED]
           ,S.[REVERSE_DATE]
           ,S.[VENDOR_ID]
           ,S.[RECEIVER_EMP_NO]
           ,S.[DOUBLE_ENTRY_SEQ]
           ,S.[SEQ_IN_VOUCHER]
           ,S.[REVERSE_SOURCE]
           ,S.[IS_DISPATCHED]
           ,S.[IS_FIXED_COST]
           ,S.[DEPRECIATION_SOURCE])
	WHEN NOT MATCHED BY SOURCE and @del_voucher_not_matched is not null and t.VOUCHER_ID = @del_voucher_not_matched THEN DELETE;
END


/** test script **/
if EXISTS(select 1 from #dirty_diary )
	drop table #dirty_diary

select top 10 * into #dirty_diary from account.DIARY 
select * from #dirty_diary

update #dirty_diary
set ExpectedDate = getdate(), IS_REMITED = 1

declare @tmp_diary as account.DIARY_TYPE;
insert into @tmp_diary 
select * from #dirty_diary

exec account.USP_UPD_DIARY @tmp_diary, null --'1010110002a'

select top 20 IS_REMITED, * from account.DIARY 

select * from account.DIARY where VOUCHER_ID = '1010110002a'