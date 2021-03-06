{*
* Copyright (C) 2017 Petr Hucik <petr@getdatakick.com>
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@getdatakick.com so we can send you a copy immediately.
*
* @author    Petr Hucik <petr@getdatakick.com>
* @copyright 2018 Petr Hucik
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*
*
*                             WARNING
*
*   do NOT MODIFY this template unless you modify javascript as well
*
*
*}
{strip}
<div class="revws-review-list">
  {if $reviewsData.productsToReview}
  <h1 class="page-heading">{l s='Could you review these products?' mod='revws'}</h1>
  <div class='revws-review-requests'>
  {foreach from=$reviewsData.productsToReview item=productId}
    {if $productId@iteration <= $reviewsData.preferences.customerMaxRequests}
    {assign "product" $reviewsData.products[$productId]}
    <div class='revws-review-request'>
      <img src="{$product.image}" />
      <h3 class='revws-review-request-name'>
        {$product.name|escape:'html':'UTF-8'}
      </h3>
    </div>
    {/if}
  {/foreach}
  </div>
  {/if}
  <h1 class="page-heading">{l s='Your reviews' mod='revws'}</h1>
  {if $reviewsData.reviews.reviews}
  {foreach from=$reviewsData.reviews.reviews item=review}
    {assign "product" $reviewsData.products[$review.productId]}
    <div class="revws-review-with-product">
      <div>
        <a href="{$product.url}">
          <img src="{$product.image}" alt="{$product.name|escape:'html':'UTF-8'}"></img>
        </a>
      </div>
      <div class="revws-review-wrapper">
        <h2>
          <a href="{$product.url}">{$product.name|escape:'html':'UTF-8'}</a>
        </h2>
        {include file="../hook/private_review_list_item.tpl" review=$review}
      </div>
    </div>
  {/foreach}
  {else}
    <div className="form-group">
    {l s="You haven't written any review yet" mod='revws'}
  </div>
  {/if}
</div>
{/strip}
