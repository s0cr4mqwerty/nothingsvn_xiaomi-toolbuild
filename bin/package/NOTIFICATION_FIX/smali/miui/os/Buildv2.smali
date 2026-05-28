.class public Lmiui/os/Buildv2;
.super Ljava/lang/Object;
.source "Build.java"


# static fields
.field public static final IS_OPENSOURCE_BUILD:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    sput-boolean v0, Lmiui/os/Buildv2;->IS_OPENSOURCE_BUILD:Z

    return-void
.end method
