{* ������ ����� �������� ����� *}
<article class="dwa-post dwa-article">
    <h1 class="dwa-postheader">����� ��������� ������</h1>
    <div class="dwa-postcontent dwa-postcontent clearfix">
        <div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
                <div class="dwa-layout-cell layout-item" style="width: 100%" >
                    {if $sent eq NULL}
                    <table cellspacing="0" cellpadding="0" width="100%" class="zebra">
                        <tr>
                            <td align="center"><span style="color:red">������ �������� ������!</span></td>
                        </tr>
                    </table>
                    {else}
                    <table cellspacing="0" cellpadding="0" width="100%" class="zebra">
                        <tr>
                            <td align="center" style="text-align: center"><span style="color: green; font-weight:bold">�������, �� ��� ����������!</span></td>
                        </tr>
                    </table>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</article>