<?php

namespace App\Entity;

use App\Repository\TrickRepository;
use DateTimeInterface;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=TrickRepository::class)
 */
class Trick
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private ?int $id = null;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private ?string $name;

    /**
     * @Gedmo\Slug(fields={"name"})
     * @ORM\Column(type="string", length=255)
     */
    private ?string $slug;

    /**
     * @ORM\Column(type="datetime")
     */
    private ?DateTimeInterface $creation_date;

    /**
     * @var Collection<int, Comment>|Comment[]
     * @ORM\OneToMany(targetEntity=Comment::class, mappedBy="trick", orphanRemoval=true)
     */
    private Collection $comments;

    /**
     * @var Collection<int, Image>|Image[]
     * @ORM\OneToMany(targetEntity=Image::class, mappedBy="trick", orphanRemoval=true, cascade={"persist"}, fetch="EAGER"))
     */
    private Collection $images;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private ?string $description = null;

    /**
     * @var Collection<int, Specificity>|Specificity[]
     * @ORM\ManyToMany(targetEntity=Specificity::class, mappedBy="trick", cascade={"persist"})
     * @ORM\JoinTable(name="specificity_trick")
     */
    private Collection $specificities;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private ?string $video = null;

    public function __construct()
    {
        $this->comments = new ArrayCollection();
        $this->images = new ArrayCollection();
        $this->specificities = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }

    public function getCreationDate(): ?DateTimeInterface
    {
        return $this->creation_date;
    }

    public function setCreationDate(DateTimeInterface $creation_date): self
    {
        $this->creation_date = $creation_date;

        return $this;
    }

    /**
     * @return Collection<int, Comment>
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(Comment $comment): self
    {
        if (!$this->comments->contains($comment)) {
            $this->comments[] = $comment;
            $comment->setTrick($this);
        }

        return $this;
    }

    public function removeComment(Comment $comment): self
    {
        if ($this->comments->removeElement($comment)) {
            // set the owning side to null (unless already changed)
            if ($comment->getTrick() === $this) {
                $comment->setTrick(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Image>
     */
    public function getImages(): Collection
    {
        return $this->images;
    }

    public function addImage(Image $image): self
    {
        if (!$this->images->contains($image)) {
            $this->images[] = $image;
            $image->setTrick($this);
        }

        return $this;
    }

    public function removeImage(Image $image): self
    {
        if ($this->images->removeElement($image)) {
            // set the owning side to null (unless already changed)
            if ($image->getTrick() === $this) {
                $image->setTrick(null);
            }
        }

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    /**
     * @return Collection<int, Specificity>
     */
    public function getSpecificities(): Collection
    {
        return $this->specificities;
    }

    public function addSpecificity(Specificity $specificity): self
    {
        if (!$this->specificities->contains($specificity)) {
            $this->specificities[] = $specificity;
            $specificity->addTrick($this);
        }

        return $this;
    }

    public function removeSpecificity(Specificity $specificity): self
    {
        if ($this->specificities->removeElement($specificity)) {
            $specificity->removeTrick($this);
        }

        return $this;
    }

    public function getVideo(): ?string
    {
        return $this->video;
    }

    public function setVideo(?string $video): self
    {
        $this->video = $video;

        return $this;
    }
}
