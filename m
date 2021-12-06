Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3132C433EF
	for <radiotap@archiver.kernel.org>; Mon,  6 Dec 2021 23:23:57 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 7D43A84DB9; Mon,  6 Dec 2021 23:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 4B4A284D67
	for <radiotap@radiotap.org>; Mon,  6 Dec 2021 23:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (1024-bit key) header.d=newratek.onmicrosoft.com
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 6M9dz4dTquDw for <radiotap@radiotap.org>;
	Mon,  6 Dec 2021 23:23:55 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id E086384D4E
	for <radiotap@radiotap.org>; Mon,  6 Dec 2021 23:23:51 +0000 (UTC)
Received: from TY2PR0101MB3423.apcprd01.prod.exchangelabs.com
 (2603:1096:404:9c::9) by TYZPR01MB3983.apcprd01.prod.exchangelabs.com
 (2603:1096:400:33::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 22:50:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cglYM8abHRCZWhaXcSqzLmTX8E+myrWMKDn4o/jrOnN8pZvdD3z5eoJn0b+0052aBJPiHPttvnv4gC3KHgvQdmJIuU508dRcL8YZm44SeGzDq+Yl2FHqnr9t8abJ+9nwONa2yXnAD32GhlEW3Vkflg7Jbhga00EnmyKudZavMVOVwyS5cgMuYTACLKzAXgCOo4T38ORQw7So/5w7F4LUEcvnQ3brl7EMlSv+N8knG4o5Ps7N14cscWepP3OlQbxIxIGkbBVN4qh/aVGjadR5ZldRhLhZl7fYkYw9tFwpEKbw/C7j4XX98UMr2zIUC+K/oDXFwv675wpf1tYODHCMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnaSVdXjCYTPAqjCRHunQHq0ssXiSZrY27DNM53mf8U=;
 b=V1fuhp/2tP/yDTm2kvs5YxFndr/UoBROojs7Mesxfe0LUCYC/JSl+Pv3jL/BmtFOMxL4vL9t8k2hlNbcvCb/dLG8eK5pd1py4k+LY4NlF2hUIUVCKoz0CL12ORW6loGz9VxkCuzmzYYPevTzblQetpRshdUouDgqSrcSbwoXzoJfIhKnmYay/MAc9yGfqyiVPasjzQmn7ON8IO//J269TRwQR0mcGYXwY/L5zzjfEWPtoLOcNtbkZqTbZm5TM4JIt+RBtGb2SIjJg9jWX2qt1Af6NjHqXR8VkKLoI7L5q6OTLcgylbf+yGnJP7AHjWYzk7DlXoUu55BdcQHGuKQNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=newracom.com; dmarc=pass action=none header.from=newracom.com;
 dkim=pass header.d=newracom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newratek.onmicrosoft.com; s=selector1-newratek-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnaSVdXjCYTPAqjCRHunQHq0ssXiSZrY27DNM53mf8U=;
 b=bcVHVx5qcMq6Ek8GelIcINFhceXFJB5pyRaor00Dx7tiC7acJL8g5IHtkwmu/Tm5Y41MoHOL9MSaDDl0ijZbhHKIKDRn7ehrNrUNScJ6t4SnPkQQuKndU3d/5E/Q1DYNBscXOpH1dMrX5NMWqv0OZooKOdXN+fZoSIm+K5j9ywU=
Received: from TY2PR0101MB2800.apcprd01.prod.exchangelabs.com
 (2603:1096:404:b7::10) by TY2PR0101MB3423.apcprd01.prod.exchangelabs.com
 (2603:1096:404:9c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 22:12:58 +0000
Received: from TY2PR0101MB2800.apcprd01.prod.exchangelabs.com
 ([fe80::a446:3303:b14a:5ffd]) by
 TY2PR0101MB2800.apcprd01.prod.exchangelabs.com
 ([fe80::a446:3303:b14a:5ffd%7]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 22:12:58 +0000
From: Aaron - Jehun Lee <jehun.lee@newracom.com>
To: Johannes Berg <johannes@sipsolutions.net>, Richard Sharpe
	<realrichardsharpe@gmail.com>, "radiotap@radiotap.org"
	<radiotap@radiotap.org>, Ray Wang <rwang@wi-fi.org>, Tasheng Lin
	<tlin@wi-fi.org>
Subject: RE: A modified, and maybe final, proposal for an S1G header for
 RadioTap
Thread-Topic: A modified, and maybe final, proposal for an S1G header for
 RadioTap
Thread-Index: AQHX6t1GErM1/1+ePkSikYAWTrfQtawmBtNw
Date: Mon, 6 Dec 2021 22:12:58 +0000
Message-ID:
 <TY2PR0101MB2800849D0A7DE202F0FF3905856D9@TY2PR0101MB2800.apcprd01.prod.exchangelabs.com>
References:
 <CACyXjPx40--VvxKhxbM1tekOcoXtpt-Cu7_KCPTk_+khfkQkHw@mail.gmail.com>
 <2f1e81e6f5771793f44940dea500357870035b8d.camel@sipsolutions.net>
In-Reply-To: <2f1e81e6f5771793f44940dea500357870035b8d.camel@sipsolutions.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=newracom.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6b32eee-58f6-4271-ef47-08d9b9058f9f
x-ms-traffictypediagnostic: TY2PR0101MB3423:EE_|TYZPR01MB3983:EE_
x-microsoft-antispam-prvs:
 <TY2PR0101MB3423633FDFD50BF6E0AA8A3B856D9@TY2PR0101MB3423.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Vtb/kbPoFu+w0KlrHOiRifLKyVoex7Ovfj1ysZBVUXTKJDOQxiza7Q2Il9JiHZ/EL8YA6MkHUq9UgBberNqAD5LUeGTBLAGm5wzoNoDhD0AJz9fE6HtYu39PObO4yp7qI00mT/YtnVP7aTP71IpRab5Fu2eUiQ9LQpOjYET4F3cWUE6vfuGQXwLVKhOew1w+NY/xok8VG8Si7omUZlbpp7xy4HYvZJUyUi3PapmMgVsOV8yphREtl1FdL2ob4Z6oKLlXkPp2FzyKQm20nxsYSL0SdrkUsykSKY0fpvc61a6Kc2UT+pJgEhNvq/wZ0eyo0R1Ke5zzft2H4ATSAXchxn9aTxH+8pPtU30MKopdquHLEf33ygkkpPouR1g1i6NslGSyxSsIJUogPDw4ReJSnFib0lzygR6kkRISEo83L7eM7TYWJVdmFE5itpjCSPSDdL57DWV7yq51b7lqiHeK8JILmkQt3Obwe1TVyU3gJ1kNaMC3dzRODxSC+4aAd92ftytURyEZsbHOpFZWPeo6eZ/TfBiDWFGURsUt8/Rzb/GeFmQULT9eJSu7x24JPMCinfXMb/nK48qhlxHdF6eEqzgjoEpAth40a6YL5SPIwzHS9Rg6/O6BQYzZQPPRg7wOj86sH3oLDwv6mLmUci81OzZa1ffx8d+zpTh2bjsIeOx62NOsyCB+XF7zv/Ho010aG6Lca5FO014n2rsSPz9KbQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR0101MB2800.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(39830400003)(136003)(376002)(5660300002)(71200400001)(38100700002)(66446008)(9686003)(66946007)(83380400001)(66476007)(7696005)(6506007)(38070700005)(26005)(64756008)(53546011)(122000001)(110136005)(8676002)(186003)(76116006)(66556008)(33656002)(4744005)(8936002)(2906002)(86362001)(508600001)(52536014)(316002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KytJL3NSOHNRb2tMZGlmQThGNFNhQ3N3aWZGSW1KWXFJaEZab1pJbDg1M0Ew?=
 =?utf-8?B?RXMxT0xlK3ZlNGJkSHlnYk0zNzR6djJkSDZtZG53UXJkczhTWjhyRm45SkYw?=
 =?utf-8?B?Q3dSTGZCcXo5dlhoUmhFTU5kTkNGRnhvZGdoTkNtODFMVlJjMjhpNGYrR2hu?=
 =?utf-8?B?S2w3OHRPUjZ5WFp0VW1nVHNQb0pzUS9TNFZNTmNiWlBIMXd1c1ZRZ3gwNkha?=
 =?utf-8?B?T0w4a1dzZGcrb2R4WlFyN3kzOHNxY1F0ZkRGeGFob1cxU1VqaUwwZGxGRGhu?=
 =?utf-8?B?dEhuVGY1U1ZTRDVNRjlnZkVsbDdnblh6TXlKNDJQU3EzRE9QK1ZPYUdWcytr?=
 =?utf-8?B?K01tV1FqOEdodXV2SUtJRjZianhiZ0ZjU2VJc3Fvd2Noc1hscnM2eHNTUE96?=
 =?utf-8?B?bW56TFZ2MTA5Z3RBVGtiRFhEL3IxOUJRdTlveCtxNE5KS01IeUUyNDNLS3po?=
 =?utf-8?B?UHRtRUx1RENvV252ZGp2Wmk5a0wrZDgwQjhZOERWbUVxeU4xZXNtNUxveHpK?=
 =?utf-8?B?aVp5QSt5UFljUHNDR285T0RTb3R1S2p0KzZCVnVIeUNYRUV4WHU5cTlwRXdB?=
 =?utf-8?B?TE1tQjkrc1c4UG9LUC9XNDN1UEZiMXZrbVdjSW54MmY4bGE4WHEzQUlXSTFo?=
 =?utf-8?B?aCt2QnU4TWs3MDFuR3kyd1orYlk1WlhnamZoYllFUzErbEJ3bS9wVVA3d0dR?=
 =?utf-8?B?OVV6cm1sSXJTYkl0YmJFbkpramNEVlQ4YkNNTGFmaGlKY1R2Y0picHJCSElp?=
 =?utf-8?B?UHBjR0JvVm5MQVZvUzEzcUpjcFY2d3c0MitIeVk5Nk4vR0gxcmRLUzNNTU1u?=
 =?utf-8?B?aDl2NFRKcnNEM29xczNaSXdOMS9kSENUOVVSTlFEckRMMzQwdTNuRVpYWWlZ?=
 =?utf-8?B?OGdHeHpyZlZqeW1vbGkxZE1oNVdxRVFtUUFvb3prdVVTZUQ1SnZtZEkyT3gr?=
 =?utf-8?B?dTNPNktFY0tUQVdhMlIzWkUvS3B5OWxXNHphOEtNSmNvaHlZZUVvbjJxbEtw?=
 =?utf-8?B?MzM4SnVEY25zbnRSR3BpMU5KY1lQNVNNaGM5ZnR0RnEyN1Z3bEptN1MzcHc2?=
 =?utf-8?B?NWJMclhNM01nd2RTSTJMK3lDRjBYMUFkQy9qWk4vL05PTHhuckhrQ0F6V1Ro?=
 =?utf-8?B?eTZPM3RxK2s4c0kxS3dRbjQ0eGZpQWxzaW5GQys1WG1CL1hBY0FhMU9kTVBY?=
 =?utf-8?B?dkdjRlo5T1NMZ0dibmY4cjNrVnJWYllnbnlFeGNiVUFXVXpSY29YYkNsZlBu?=
 =?utf-8?B?QnJZUUlyVzUrZ1lZNjVwSElOdGpMdkhqUElrQ0IyUXZKZFVmNnBrL1daQlA4?=
 =?utf-8?B?RGNkcThmcnExamI5THhiS0kvclloZTkxbGRwZFROOEU3TU1CbGNkZXJNZklF?=
 =?utf-8?B?N0hNRFJraHFoMTJaU1YraEdKVGgvK2RkN2RlcFFxVnhKdS9KYnpkRklnc2Fz?=
 =?utf-8?B?WUtibTk2RE1mYnlQOXN2OEd6NFVoWGpnWExUZ1ZtVmhDbFo4ZnFrK3cya1hD?=
 =?utf-8?B?T25IcnIrN2padnlZa3JZVklmUmJZcHNmYmI1ZTA1ZHZKUUNXVnZqamhZQkVL?=
 =?utf-8?B?ZEhBQUJiVWNtQ0tNYnY4dHdJZXRaUENqTll0VUl5WGE1eWVaam1KbVdtdXo0?=
 =?utf-8?B?NlZnUjFVVFpPRG1OVGlHMjFFRHpnRXNLUHRFVEFUNWRkY2REaStYNjN4cDNF?=
 =?utf-8?B?YnNDbmhMTVZsbGg4ZnlUSE50UVZyRVJKN2EwMVYzbnI2b0JIMDQ3M1F3Mmw1?=
 =?utf-8?B?a09UQmNENzhGK2Y4L3FKOXduQ1d1VVRISHFJRW9kWFBMZ3MwcnhlVzVhUitU?=
 =?utf-8?B?ZktBWlpreHVPMkt6czlqaTk3ZVYySG5HcG94Vkt1Z2xDN1hMZ2xwSkQ1ZTRE?=
 =?utf-8?B?QnAwdzhOZkRBbUVmbWVVN0Q1S2dQSE1wNTJtSUxRZ1M4MGxxZUw1dDVZV2dh?=
 =?utf-8?B?eTYxVE5NLzdWeFA2R3IwaS9PR2pOMmNjVlhvaFRTWmRST1FjVFpLbUVoOEx5?=
 =?utf-8?B?YklxVHNjSy9LN3JzU2RuMm1qeG5sc2J2WEgzK0E2OXdpYm1Kblc1M0lNcGtw?=
 =?utf-8?B?K2t3YVQxMll0MWJqS1BHdXFrRW9EelNvQVM1RWJxUWo1ODlHYVJ4bmw2aHVV?=
 =?utf-8?B?eTF3bE5ySzAyZmVDVGVBZjFjQ3V5c2VhWXFKV3AxZDVmSzVTQXdtODdCUnRO?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR0101MB2800.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b32eee-58f6-4271-ef47-08d9b9058f9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 22:12:58.4074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5494d269-d3ac-4a40-bf0d-8c29f5475032
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F8KrxR3mQ1y0NdGEG6QLAVamj518W6xNYed6kb+JEZuh1L0Iww+ZxFntqCgnfmjNn1l3uov679uUeSxQG6O7vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR0101MB3423
X-OriginatorOrg: newracom.com
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

SGkgSm9oYW5uZXMsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBlbWFpbC4gSSBoYXZlIG5vIG9iamVj
dGlvbi4NCg0KQmVzdCwNCkFhcm9uDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gDQpTZW50OiBNb25kYXks
IERlY2VtYmVyIDYsIDIwMjEgMTI6MTAgUE0NClRvOiBSaWNoYXJkIFNoYXJwZSA8cmVhbHJpY2hh
cmRzaGFycGVAZ21haWwuY29tPjsgcmFkaW90YXBAcmFkaW90YXAub3JnOyBSYXkgV2FuZyA8cndh
bmdAd2ktZmkub3JnPjsgQWFyb24gLSBKZWh1biBMZWUgPGplaHVuLmxlZUBuZXdyYWNvbS5jb20+
OyBUYXNoZW5nIExpbiA8dGxpbkB3aS1maS5vcmc+DQpTdWJqZWN0OiBSZTogQSBtb2RpZmllZCwg
YW5kIG1heWJlIGZpbmFsLCBwcm9wb3NhbCBmb3IgYW4gUzFHIGhlYWRlciBmb3IgUmFkaW9UYXAN
Cg0KT24gU3VuLCAyMDE5LTA0LTE0IGF0IDA4OjU3IC0wNzAwLCBSaWNoYXJkIFNoYXJwZSB3cm90
ZToNCj4gSGkgZm9sa3MsDQo+IA0KPiBIZXJlIGlzIGFuIHVwZGF0ZWQgcHJvcG9zYWwgZm9yIHRo
aXMgaGVhZGVyLg0KPiANCg0KSSB0aGluayB3ZSBzaG91bGQganVzdCBhZG9wdCB0aGlzLiBZZWFy
cyBoYXZlIGxpdGVyYWxseSBwYXNzZWQsIGFuZCBJJ20gcHJldHR5IHN1cmUgaXQncyBhY3R1YWxs
eSB1c2VkIGFzLWlzIGluIHRoZSB3aWxkLg0KDQpBbnkgb2JqZWN0aW9ucz8gSWYgbm90IEknbGwg
Z28gYWRkIGl0IHRvIHRoZSBzcGVjIHNvb24uDQoNCmpvaGFubmVzDQo=
